<?php

namespace common\models\teachers;

use Yii;

/**
 * This is the model class for table "{{%teachers_direction_cost}}".
 *
 * @property int $id
 * @property int $direction_id
 * @property int $stake_id
 * @property int $teachers_id
 * @property int $main_flag
 *
 * @property Teachers $teachers
 * @property TeachersDirection $direction
 * @property TeachersStake $stake
 */
class DirectionCost extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%teachers_direction_cost}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['direction_id', 'stake_id', 'teachers_id'], 'required'],
            [['direction_id', 'stake_id', 'teachers_id', 'main_flag'], 'integer'],
            ['main_flag', 'unique', 'targetAttribute' => ['main_flag', 'teachers_id']], // проверка уникальности пары
            ['direction_id', 'unique', 'targetAttribute' => ['direction_id', 'teachers_id']], // проверка уникальности пары
            [['direction_id', 'stake_id'], 'exist', 'skipOnError' => true, 'targetClass' => Cost::className(), 'targetAttribute' => ['direction_id' => 'direction_id', 'stake_id' => 'stake_id']],
            [['teachers_id'], 'exist', 'skipOnError' => true, 'targetClass' => Teachers::className(), 'targetAttribute' => ['teachers_id' => 'id']],
            [['direction_id'], 'exist', 'skipOnError' => true, 'targetClass' => Direction::className(), 'targetAttribute' => ['direction_id' => 'id']],
            [['stake_id'], 'exist', 'skipOnError' => true, 'targetClass' => Stake::className(), 'targetAttribute' => ['stake_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/teachers', 'ID'),
            'direction_id' => Yii::t('yee/teachers', 'Direction ID'),
            'stake_id' => Yii::t('yee/teachers', 'Stake ID'),
            'teachers_id' => Yii::t('yee/teachers', 'Teachers ID'),
            'main_flag' => Yii::t('yee/teachers', 'Main Flag'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTeachers()
    {
        return $this->hasOne(Teachers::className(), ['id' => 'teachers_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDirection()
    {
        return $this->hasOne(Direction::className(), ['id' => 'direction_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStake()
    {
        return $this->hasOne(Stake::className(), ['id' => 'stake_id']);
    }
}
