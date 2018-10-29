<?php

namespace common\models\student;

use Yii;
use common\models\user\User;
/**
 * This is the model class for table "{{%student}}".
 *
 * @property int $id
 * @property int $user_id
 * @property int $position_id
 * @property string $sertificate_name
 * @property string $sertificate_series
 * @property string $sertificate_num
 * @property string $sertificate_organ
 * @property string $sertificate_date
 *
 * @property StudentPosition $position
 * @property User $user
 */
class Student extends \yii\db\ActiveRecord
{
    public $sertificate_date;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%student}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['position_id'], 'required'],
            [['user_id', 'position_id','sertificate_timestamp'], 'integer'],
            ['sertificate_date', 'validateDateCorrect'],
            [['sertificate_name', 'sertificate_series', 'sertificate_num'], 'string', 'max' => 32],
            [['sertificate_organ'], 'string', 'max' => 127],
            [['position_id'], 'exist', 'skipOnError' => true, 'targetClass' => StudentPosition::className(), 'targetAttribute' => ['position_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
            // при заполнении одного из полей, делаем обязательными остальные поля блока документа
            [['sertificate_series', 'sertificate_num', 'sertificate_organ', 'sertificate_date'], 'required', 'when' => function ($model) { return $model->sertificate_name != NULL; }, 'enableClientValidation' => false],
            [['sertificate_name', 'sertificate_num', 'sertificate_organ', 'sertificate_date'], 'required', 'when' => function ($model) { return $model->sertificate_series != NULL; }, 'enableClientValidation' => false],
            [['sertificate_name', 'sertificate_series', 'sertificate_organ', 'sertificate_date'], 'required', 'when' => function ($model) { return $model->sertificate_num != NULL; }, 'enableClientValidation' => false],
            [['sertificate_name', 'sertificate_num', 'sertificate_series', 'sertificate_date'], 'required', 'when' => function ($model) { return $model->sertificate_organ != NULL; }, 'enableClientValidation' => false],
            [['sertificate_name', 'sertificate_num', 'sertificate_series', 'sertificate_organ'], 'required', 'when' => function ($model) { return $model->sertificate_date != NULL; }, 'enableClientValidation' => false],

        ];
    }
    /**
     * Check validate date
     */
    public function validateDateCorrect() {
        $error = false;
        if ($this->sertificate_date) {
            if (!preg_match("|([0-9]{1,2})-([0-9]{1,2})-([0-9]{2,4})|", $this->sertificate_date)) {
                $error = true;
                $this->addError('sertificate_date', Yii::t('yee/student', 'The format of the date input {sertificate_date} invalid', ['sertificate_date' => $this->sertificate_date]));
            }
            if (!$error) {
                $d_in = explode("-", $this->sertificate_date);
                if (checkdate($d_in[1], $d_in[0], $d_in[2]) != TRUE) {
                    $this->addError('sertificate_date', Yii::t('yee/student', 'There is no such date {sertificate_date}', ['sertificate_date' => $this->sertificate_date]));
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
            'id' => Yii::t('yee/student', 'ID'),
            'user_id' => Yii::t('yee/student', 'User ID'),
            'position_id' => Yii::t('yee/student', 'Position ID'),
            'sertificate_name' => Yii::t('yee/student', 'Sertificate Name'),
            'sertificate_series' => Yii::t('yee/student', 'Sertificate Series'),
            'sertificate_num' => Yii::t('yee/student', 'Sertificate Num'),
            'sertificate_organ' => Yii::t('yee/student', 'Sertificate Organ'),
            'sertificate_date' => Yii::t('yee/student', 'Sertificate Date'),
            'studentsFullName' => Yii::t('yee', 'Full Name'),
        ];
    }
    /**
     * Преобразование даты в timestamp
     */
    public function getDateToTimestamp($mask = "-") {
        $d_in = explode($mask, $this->sertificate_date);
        return $this->sertificate_timestamp = mktime(0, 0, 0, $d_in[1], $d_in[0], $d_in[2]);
    }

    /**
     * Преобразование timestamp в дату
     */
    public function getTimestampToDate($mask = "d-m-Y") {
        return $this->sertificate_date = date($mask, $this->sertificate_timestamp);
    }
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPosition()
    {
        return $this->hasOne(StudentPosition::className(), ['id' => 'position_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
    /**
     * Геттер полного имени юзера
     */
    public function getStudentsFullName()
    {
        return $this->user->fullName;
    }
}
