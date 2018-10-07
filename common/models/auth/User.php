<?php

namespace common\models\auth;

use yeesoft\helpers\AuthHelper;
use yeesoft\helpers\YeeHelper;
use yeesoft\models\Role;
use yeesoft\models\Route;
use yeesoft\models\UserIdentity;
use yeesoft\models\UserQuery;
use Yii;
use yii\behaviors\TimestampBehavior;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "user".
 *
 * @property integer $id
 * @property string $username
 * @property string $email
 * @property integer $email_confirmed
 * @property string $auth_key
 * @property string $password_hash
 * @property string $confirmation_token
 * @property string $bind_to_ip
 * @property string $registration_ip
 * @property integer $status
 * @property integer $superadmin
 * @property string $avatar
 * @property integer $created_at
 * @property integer $updated_at
 */
class User extends UserIdentity {

    const STATUS_ACTIVE = 10;
    const STATUS_INACTIVE = 0;
    const STATUS_BANNED = -1;
    const SCENARIO_NEW_USER = 'newUser';
    const GENDER_NOT_SET = 0;
    const GENDER_MALE = 1;
    const GENDER_FEMALE = 2;
    const USER_CATEGORY_STAFF = 1;
    const USER_CATEGORY_TEACHER = 2;
    const USER_CATEGORY_STUDENT = 3;
    const USER_CATEGORY_PARENT = 4;

    /**
     * @var string
     */
    public $gridRoleSearch;

    /**
     * @var string
     */
    public $birth_date;

    /**
     * @var string
     */
    public $password;

    /**
     * @var string
     */
    public $repeat_password;

    /**
     * @inheritdoc
     */
    public static function tableName() {
        return Yii::$app->yee->user_table;
    }

    /**
     * @inheritdoc
     */
    public function behaviors() {
        return [
            TimestampBehavior::className(),
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
            [['username', 'email'], 'required'],
            ['birth_timestamp', 'integer'],
            ['birth_date', 'validateDateCorrect'],
            ['username', 'unique'],
            [['username', 'email', 'bind_to_ip'], 'trim'],
            ['email', 'email'],
            [['status', 'user_category', 'email_confirmed'], 'integer'],
            ['bind_to_ip', 'validateBindToIp'],
            ['bind_to_ip', 'string', 'max' => 255],
            [['first_name', 'middle_name', 'last_name'], 'string', 'max' => 124],
            [['first_name', 'middle_name', 'last_name'], 'trim'],
            [['first_name', 'middle_name', 'last_name'], 'match', 'pattern' => Yii::$app->yee->cyrillicRegexp, 'message' => Yii::t('yee', 'Only need to enter Russian letters')],
            [['snils'], 'string', 'max' => 16],
            [['phone', 'phone_optional'], 'string', 'max' => 24],
            ['bind_to_ip', 'string', 'max' => 255],
            ['info', 'string', 'max' => 1024],
            ['gender', 'integer'],
            ['password', 'required', 'on' => [self::SCENARIO_NEW_USER, 'changePassword']],
            ['password', 'string', 'max' => 255, 'on' => [self::SCENARIO_NEW_USER, 'changePassword']],
            ['password', 'string', 'min' => 6, 'on' => [self::SCENARIO_NEW_USER, 'changePassword']],
            ['password', 'trim', 'on' => [self::SCENARIO_NEW_USER, 'changePassword']],
            ['repeat_password', 'required', 'on' => [self::SCENARIO_NEW_USER, 'changePassword']],
            ['repeat_password', 'compare', 'compareAttribute' => 'password'],
            ['user_category', 'default', 'value' => self::USER_CATEGORY_STAFF],
            ['user_category', 'in', 'range' => [self::USER_CATEGORY_STAFF, self::USER_CATEGORY_TEACHER, self::USER_CATEGORY_STUDENT, self::USER_CATEGORY_PARENT]],
        ];
    }

    /* Геттер для полного имени человека */

    public function getFullName() {
        return $this->last_name . ' ' . $this->first_name . ' ' . $this->middle_name;
    }

    /**
     * Store result in session to prevent multiple db requests with multiple calls
     *
     * @param bool $fromSession
     *
     * @return static
     */
    public static function getCurrentUser($fromSession = true) {
        if (!$fromSession) {
            return static::findOne(Yii::$app->user->id);
        }

        $user = Yii::$app->session->get('__currentUser');

        if (!$user) {
            $user = static::findOne(Yii::$app->user->id);

            Yii::$app->session->set('__currentUser', $user);
        }

        return $user;
    }

    /**
     * Assign role to user
     *
     * @param int $userId
     * @param string $roleName
     *
     * @return bool
     */
    public static function assignRole($userId, $roleName) {
        try {
            Yii::$app->db->createCommand()
                    ->insert(Yii::$app->yee->auth_assignment_table, [
                        'user_id' => $userId,
                        'item_name' => $roleName,
                        'created_at' => time(),
                    ])->execute();

            AuthHelper::invalidatePermissions();

            return true;
        } catch (\Exception $e) {
            return false;
        }
    }

    /**
     * Assign roles to user
     *
     * @param int $userId
     * @param array $roles
     *
     * @return bool
     */
    public function assignRoles(array $roles) {
        foreach ($roles as $role) {
            User::assignRole($this->id, $role);
        }
    }

    /**
     * Revoke role from user
     *
     * @param int $userId
     * @param string $roleName
     *
     * @return bool
     */
    public static function revokeRole($userId, $roleName) {
        $result = Yii::$app->db->createCommand()
                        ->delete(Yii::$app->yee->auth_assignment_table, ['user_id' => $userId, 'item_name' => $roleName])
                        ->execute() > 0;

        if ($result) {
            AuthHelper::invalidatePermissions();
        }

        return $result;
    }

    /**
     * @param string|array $roles
     * @param bool $superAdminAllowed
     *
     * @return bool
     */
    public static function hasRole($roles, $superAdminAllowed = true) {
        if ($superAdminAllowed AND Yii::$app->user->isSuperadmin) {
            return true;
        }
        $roles = (array) $roles;

        AuthHelper::ensurePermissionsUpToDate();

        return array_intersect($roles, Yii::$app->session->get(AuthHelper::SESSION_PREFIX_ROLES, [])) !== [];
    }

    /**
     * @param string $permission
     * @param bool $superAdminAllowed
     *
     * @return bool
     */
    public static function hasPermission($permission, $superAdminAllowed = true) {
        if ($superAdminAllowed AND Yii::$app->user->isSuperadmin) {
            return true;
        }

        AuthHelper::ensurePermissionsUpToDate();

        return in_array($permission, Yii::$app->session->get(AuthHelper::SESSION_PREFIX_PERMISSIONS, []));
    }

    /**
     * Useful for Menu widget
     *
     * <example>
     *    ...
     *        [ 'label'=>'Some label', 'url'=>['/site/index'], 'visible'=>User::canRoute(['/site/index']) ]
     *    ...
     * </example>
     *
     * @param string|array $route
     * @param bool $superAdminAllowed
     *
     * @return bool
     */
    public static function canRoute($route, $superAdminAllowed = true) {
        if ($superAdminAllowed AND Yii::$app->user->isSuperadmin) {
            return true;
        }

        $baseRoute = AuthHelper::unifyRoute($route);

        if (substr($baseRoute, 0, 4) === "http") {
            return true;
        }

        if (Route::isFreeAccess($baseRoute)) {
            return true;
        }

        AuthHelper::ensurePermissionsUpToDate();

        return Route::isRouteAllowed($baseRoute, Yii::$app->session->get(AuthHelper::SESSION_PREFIX_ROUTES, []));
    }

    /**
     * getStatusList
     * @return array
     */
    public static function getStatusList() {
        return array(
            self::STATUS_ACTIVE => Yii::t('yee', 'Active'),
            self::STATUS_INACTIVE => Yii::t('yee', 'Inactive'),
            self::STATUS_BANNED => Yii::t('yee', 'Banned'),
        );
    }

    /**
     * Get gender list
     * @return array
     */
    public static function getGenderList() {
        return array(
            self::GENDER_NOT_SET => Yii::t('yii', '(not set)'),
            self::GENDER_MALE => Yii::t('yee', 'Male'),
            self::GENDER_FEMALE => Yii::t('yee', 'Female'),
        );
    }

    /**
     * Get gender list
     * @return array
     */
    public static function getUserCategoryList() {
        return array(
            self::USER_CATEGORY_STAFF => Yii::t('yee', 'Staff'),
            self::USER_CATEGORY_TEACHER => Yii::t('yee', 'Teacher'),
            self::USER_CATEGORY_STUDENT => Yii::t('yee', 'Student'),
            self::USER_CATEGORY_PARENT => Yii::t('yee', 'Parent'),
        );
    }

    /**
     * getUsersList
     *
     * @return array
     */
    public static function getUsersList() {
        $users = static::find()->select(['id', 'username'])->asArray()->all();
        return ArrayHelper::map($users, 'id', 'username');
    }

    /**
     * getStatusValue
     *
     * @param string $val
     *
     * @return string
     */
    public static function getStatusValue($val) {
        $ar = self::getStatusList();

        return isset($ar[$val]) ? $ar[$val] : $val;
    }

    /**
     * getFunctionValue
     *
     * @param string $val
     *
     * @return string
     */
    public static function getUserCategoryValue($val) {
        $ar = self::getUserCategoryList();

        return isset($ar[$val]) ? $ar[$val] : $val;
    }

    /**
     * Generates new password reset token
     */
    public function generatePasswordResetToken() {
        $this->password_reset_token = Yii::$app->security->generateRandomString() . '_' . time();
    }

    /**
     * Check that there is no such confirmed E-mail in the system
     */
    public function validateEmailUnique() {
        if ($this->email) {
            $exists = User::findOne(['email' => $this->email]);

            if ($exists AND $exists->id != $this->id) {
                $this->addError('email', Yii::t('yee', 'This e-mail already exists'));
            }
        }
    }

    /**
     * Check validate date
     */
    public function validateDateCorrect() {
        $error = false;
        if ($this->birth_date) {
            if (!preg_match("|([0-9]{1,2})-([0-9]{1,2})-([0-9]{2,4})|", $this->birth_date)) {
                $error = true;
                $this->addError('birth_date', Yii::t('yee', 'The format of the date input {birth_date} invalid', ['birth_date' => $this->birth_date]));
            }
            if (!$error) {
                $d_in = explode("-", $this->birth_date);
                if (checkdate($d_in[1], $d_in[0], $d_in[2]) != TRUE) {
                    $this->addError('birth_date', Yii::t('yee', 'There is no such date {birth_date}', ['birth_date' => $this->birth_date]));
                }
            }
        }
    }

    /**
     * Validate bind_to_ip attr to be in correct format
     */
    public function validateBindToIp() {
        if ($this->bind_to_ip) {
            $ips = explode(',', $this->bind_to_ip);

            foreach ($ips as $ip) {
                if (!filter_var(trim($ip), FILTER_VALIDATE_IP)) {
                    $this->addError('bind_to_ip', Yii::t('yee', "Wrong format. Enter valid IPs separated by comma"));
                }
            }
        }
    }

    /**
     * Преобразование даты в timestamp
     */
    public function getDateToTimestamp($mask = "-") {
        $d_in = explode($mask, $this->birth_date);
        return $this->birth_timestamp = mktime(0, 0, 0, $d_in[1], $d_in[0], $d_in[2]);
    }

    /**
     * Преобразование timestamp в дату
     */
    public function getTimestampToDate($mask = "d-m-Y") {
        return $this->birth_date = date($mask, $this->birth_timestamp);
    }

    /**
     * @return array
     */
    public function attributeLabels() {
        return [
            'id' => Yii::t('yee', 'ID'),
            'username' => Yii::t('yee', 'Login'),
            'superadmin' => Yii::t('yee', 'Superadmin'),
            'confirmation_token' => Yii::t('yee', 'Confirmation Token'),
            'registration_ip' => Yii::t('yee', 'Registration IP'),
            'bind_to_ip' => Yii::t('yee', 'Bind to IP'),
            'status' => Yii::t('yee', 'Status'),
            'role' => Yii::t('yee', 'Role'),
            'gridRoleSearch' => Yii::t('yee', 'Roles'),
            'created_at' => Yii::t('yee', 'Created'),
            'updated_at' => Yii::t('yee', 'Updated'),
            'password' => Yii::t('yee', 'Password'),
            'repeat_password' => Yii::t('yee', 'Repeat password'),
            'email_confirmed' => Yii::t('yee', 'E-mail confirmed'),
            'email' => Yii::t('yee', 'E-mail'),
            'first_name' => Yii::t('yee', 'First Name'),
            'middle_name' => Yii::t('yee', 'Middle Name'),
            'last_name' => Yii::t('yee', 'Last Name'),
            'phone' => Yii::t('yee', 'Phone'),
            'phone_optional' => Yii::t('yee', 'Phone Optional'),
            'gender' => Yii::t('yee', 'Gender'),
            'info' => Yii::t('yee', 'Short Info'),
            'snils' => Yii::t('yee', 'Snils'),
            'birth_date' => Yii::t('yee', 'Birth Date'),
            'user_category' => Yii::t('yee', 'User Category'),
            'fullName' => Yii::t('yee', 'Full Name'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRoles() {
        return $this->hasMany(Role::className(), ['name' => 'item_name'])
                        ->viaTable(Yii::$app->yee->auth_assignment_table, ['user_id' => 'id']);
    }

    /**
     * Make sure user will not deactivate himself and superadmin could not demote himself
     * Also don't let non-superadmin edit superadmin
     *
     * @inheritdoc
     */
    public function beforeSave($insert) {
        if ($insert) {
            if (php_sapi_name() != 'cli') {
                $this->registration_ip = YeeHelper::getRealIp();
            }
            $this->generateAuthKey();
        } else {
            // Console doesn't have Yii::$app->user, so we skip it for console
            if (php_sapi_name() != 'cli') {
                if (Yii::$app->user->id == $this->id) {
                    // Make sure user will not deactivate himself
                    // $this->status = static::STATUS_ACTIVE; //Пользователь деактивирует себя при изменении e-mail - Model ProfileForm
                    // Superadmin could not demote himself
                    if (Yii::$app->user->isSuperadmin AND $this->superadmin != 1) {
                        $this->superadmin = 1;
                    }
                }

                // Don't let non-superadmin edit superadmin
                if (!Yii::$app->user->isSuperadmin AND $this->oldAttributes['superadmin'] == 1
                ) {
                    return false;
                }
            }
        }

        // If password has been set, than create password hash
        if ($this->password) {
            $this->setPassword($this->password);
        }

        return parent::beforeSave($insert);
    }

    /**
     * Don't let delete yourself and don't let non-superadmin delete superadmin
     *
     * @inheritdoc
     */
    public function beforeDelete() {
        // Console doesn't have Yii::$app->user, so we skip it for console
        if (php_sapi_name() != 'cli') {
            // Don't let delete yourself
            if (Yii::$app->user->id == $this->id) {
                return false;
            }

            // Don't let non-superadmin delete superadmin
            if (!Yii::$app->user->isSuperadmin AND $this->superadmin == 1) {
                return false;
            }
        }

        return parent::beforeDelete();
    }

    /**
     * @inheritdoc
     * @return PostQuery the active query used by this AR class.
     */
    public static function find() {
        return new UserQuery(get_called_class());
    }

    /**
     * Get created date
     *
     * @return string
     */
    public function getCreatedDate() {
        return Yii::$app->formatter->asDate(($this->isNewRecord) ? time() : $this->created_at);
    }

    /**
     * Get created date
     *
     * @return string
     */
    public function getUpdatedDate() {
        return Yii::$app->formatter->asDate(($this->isNewRecord) ? time() : $this->updated_at);
    }

    /**
     * Get created time
     *
     * @return string
     */
    public function getCreatedTime() {
        return Yii::$app->formatter->asTime(($this->isNewRecord) ? time() : $this->created_at);
    }

    /**
     * Get created time
     *
     * @return string
     */
    public function getUpdatedTime() {
        return Yii::$app->formatter->asTime(($this->isNewRecord) ? time() : $this->updated_at);
    }

    /**
     * Get created datetime
     *
     * @return string
     */
    public function getCreatedDatetime() {
        return "{$this->createdDate} {$this->createdTime}";
    }

    /**
     * Get created datetime
     *
     * @return string
     */
    public function getUpdatedDatetime() {
        return "{$this->updatedDate} {$this->updatedTime}";
    }

    /**
     *
     * @param string $size
     * @return boolean|string
     */
    public function getAvatar($size = 'small') {
        if (!empty($this->avatar)) {
            $avatars = json_decode($this->avatar);

            if (isset($avatars->$size)) {
                return $avatars->$size;
            }
        }

        return false;
    }

    /**
     *
     * @param array $avatars
     */
    public function setAvatars($avatars) {
        $this->avatar = json_encode($avatars);
        return $this->save();
    }

    /**
     *
     */
    public function removeAvatar() {
        $this->avatar = '';
        return $this->save();
    }

    /**
     * Первая буква заглавная
     */
    protected function getUcFirst($str, $encoding = 'UTF-8') {
        /* $str = mb_ereg_replace('^[\ ]+', '', $str);
          $str = mb_strtoupper(mb_substr($str, 0, 1, $encoding), $encoding) .
          mb_substr($str, 1, mb_strlen($str), $encoding); */
        $str = mb_convert_case($str, MB_CASE_TITLE, $encoding);
        return $str;
    }

    /**
     * До валидации формируем строки с первой заглавной
     */
    public function beforeValidate() {

        $this->first_name = User::getUcFirst($this->first_name);
        $this->middle_name = User::getUcFirst($this->middle_name);
        $this->last_name = User::getUcFirst($this->last_name);


        return parent::beforeValidate();
    }

}
