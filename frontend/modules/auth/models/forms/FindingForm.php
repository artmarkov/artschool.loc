<?php
/**
 * Created by PhpStorm.
 * User: Артур
 * Date: 17.06.2018
 * Time: 19:58
 */

namespace frontend\modules\auth\models\forms;

use common\models\auth\User;
use yeesoft\auth\AuthModule;
use Yii;
use yii\base\Model;
use dosamigos\transliterator\TransliteratorHelper;

class FindingForm extends User
{

    public $first_name;
    public $middle_name;
    public $last_name;
    public $birth_date;
    public $birth_timestamp;


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['first_name', 'last_name'], 'required'],
            ['birth_date','required'],
            ['birth_date','validateDateCorrect'],
            [['first_name', 'middle_name', 'last_name'], 'trim'],
            [['first_name', 'middle_name', 'last_name'], 'string', 'max' => 124],
            [['first_name', 'middle_name', 'last_name'], 'match', 'pattern' => Yii::$app->yee->cyrillicRegexp, 'message' => Yii::t('yee', 'Only need to enter Russian letters')],
            [['birth_timestamp'],'integer'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'first_name' => Yii::t('yee', 'First Name'),
            'middle_name' => Yii::t('yee', 'Middle Name'),
            'last_name' => Yii::t('yee', 'Last Name'),
            'birth_date' => Yii::t('yee', 'Birth Date'),
        ];
    }

    /**
     * Finds user by fio and birth-date
     *
     * @param  string $last_name, $first_name, $middle_name, $birth_timestamp, $status
     * @return static|null|User
     */

    public static function findByFio($last_name, $first_name, $middle_name, $birth_timestamp, $status)
    {
        return User::findOne([
            'last_name' => $last_name,
            'first_name' => $first_name,
            'middle_name' => $middle_name,
            'birth_timestamp' => $birth_timestamp,
            'status' => $status,
        ]);
    }
    /**
     * Finds user by username
     *
     * @param  string $username
     * @return static|null
     */
    /*public static function findInactiveByUsername($username)
    {
        return User::findOne(['username' => $username, 'status' => User::STATUS_INACTIVE]);
    }*/

    public static function generateUsername($last_name, $first_name, $middle_name)
    {
        $last_name = static::slug($last_name);
        $first_name = static::slug($first_name);
        $middle_name = static::slug($middle_name);

        $i = 0;

        do {
            $username = $last_name . '-' . substr($first_name, 0, ++$i) . substr($middle_name, 0, 1);
        } while (User::findByUsername($username));

        return $username;
    }
    /**
     * Slug translit
     *
     * @param  string $slug
     * @return static|null
     */
    protected static function slug($string, $replacement = '-', $lowercase = true)
    {
        $string = preg_replace('/[^\p{L}\p{Nd}]+/u', $replacement, $string);
        $string = TransliteratorHelper::process($string, 'UTF-8');
        return $lowercase ? mb_strtolower($string) : $string;
    }
}