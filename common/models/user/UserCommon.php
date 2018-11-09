<?php

namespace common\models\user;

use Yii;
use yii\behaviors\TimestampBehavior;
/**
 * This is the model class for table "{{%user}}".
 *
 * @property int $status
 * @property int $user_category
 * @property int $created_at
 * @property int $updated_at
 * @property string $first_name
 * @property string $middle_name
 * @property string $last_name
 * @property int $birth_timestamp
 * @property int $gender
 * @property string $phone
 * @property string $phone_optional 
 * @property string $snils
 * 
 */
class UserCommon extends \yeesoft\models\UserIdentity
{
    public $user_id;
    public $user_slave_id;
    /**
     * @var string
     */
    public $birth_date;
    
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
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['first_name', 'middle_name', 'last_name', 'birth_date'], 'required'],
            [['status', 'user_category', 'gender'], 'integer'],
            ['birth_timestamp', 'integer'],
            ['birth_date', 'string'],
            ['birth_date', 'validateDateCorrect'],
            [['first_name', 'middle_name', 'last_name'], 'string', 'max' => 124],
            [['first_name', 'middle_name', 'last_name'], 'trim'],
            [['first_name', 'middle_name', 'last_name'], 'match', 'pattern' => Yii::$app->yee->cyrillicRegexp, 'message' => Yii::t('yee', 'Only need to enter Russian letters')],
            ['last_name', 'unique', 'targetAttribute' => ['last_name', 'first_name', 'middle_name'], 'message' => Yii::t('yee/auth', 'The user with the entered data already exists.')],
            [['phone', 'phone_optional'], 'string', 'max' => 24],           
            [['snils'], 'string', 'max' => 16],
            
        ];
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
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee', 'ID'),
            'status' => Yii::t('yee', 'Status'),
            'user_category' => Yii::t('yee', 'User Category'),
            'first_name' => Yii::t('yee', 'First Name'),
            'middle_name' => Yii::t('yee', 'Middle Name'),
            'last_name' => Yii::t('yee', 'Last Name'),
            'birth_date' => Yii::t('yee', 'Birth Date'),
            'gender' => Yii::t('yee', 'Gender'),
            'phone' => Yii::t('yee', 'Phone'),
            'phone_optional' => Yii::t('yee', 'Phone Optional'),
            'snils' => Yii::t('yee', 'Snils'),
            'created_at' => Yii::t('yee', 'Created At'),
            'updated_at' => Yii::t('yee', 'Updated At'),
        ];
    }
     /* Геттер для полного имени человека */

    public function getFullName() {
        return $this->last_name . ' ' . $this->first_name . ' ' . $this->middle_name;
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

        $this->first_name = UserCommon::getUcFirst($this->first_name);
        $this->middle_name = UserCommon::getUcFirst($this->middle_name);
        $this->last_name = UserCommon::getUcFirst($this->last_name);


        return parent::beforeValidate();
    }

    /**
     * Функция возвращает массив id родителей, которых можно добавить к ученику.
     * Не учитываются уже добавленные родители
     * Вызывается в форме _form Student models
     */
     public static function getUserParentList($id)
    {
        return \yii\helpers\ArrayHelper::map(UserCommon::find()
            ->leftJoin('user_family', 'user.id = user_family.user_slave_id')
            ->andWhere(['not in', 'user.status', User::STATUS_BANNED]) // заблокированных не добавляем в список
            ->andWhere(['in', 'user.user_category', User::USER_CATEGORY_PARENT]) // только родителей
           // ->andWhere(['not in', 'user.user_category', User::USER_CATEGORY_STUDENT]) // если добавляем родителей из числа других юзеров
            ->andWhere(['or',['not in', 'user_family.user_main_id', $id], ['is', 'user_family.user_main_id', NULL]])
            ->select(['user.id as user_id', "CONCAT(user.last_name, ' ',user.first_name, ' ',user.middle_name) AS name"])
            ->orderBy('user.last_name')
            ->asArray()->all(), 'user_id', 'name');
    }
}
