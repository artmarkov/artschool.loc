<?php

namespace common\models\student;

use Yii;
use common\models\auth\User;
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
            [['position_id', 'sertificate_name', 'sertificate_series', 'sertificate_num', 'sertificate_organ', 'sertificate_date'], 'required'],
            [['user_id', 'position_id'], 'integer'],
            [['sertificate_date'], 'safe'],
            [['sertificate_name', 'sertificate_series', 'sertificate_num'], 'string', 'max' => 32],
            [['sertificate_organ'], 'string', 'max' => 127],
            [['position_id'], 'exist', 'skipOnError' => true, 'targetClass' => StudentPosition::className(), 'targetAttribute' => ['position_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
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
        ];
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
}
