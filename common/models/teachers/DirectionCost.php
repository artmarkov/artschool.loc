<?php

namespace common\models\teachers;

use Yii;

/**
 * This is the model class for table "{{%teachers_direction_cost}}".
 *
 * @property int $id
 * @property int $direction_id
 * @property int $teachers_id
 * @property int $main_flag
 *
 * @property Direction $direction
 * @property Teachers $teachers
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
            [['direction_id', 'teachers_id'], 'required'],
            [['direction_id', 'teachers_id', 'main_flag'], 'integer'],
            [['direction_id'], 'exist', 'skipOnError' => true, 'targetClass' => Direction::className(), 'targetAttribute' => ['direction_id' => 'id']],
            [['teachers_id'], 'exist', 'skipOnError' => true, 'targetClass' => Teachers::className(), 'targetAttribute' => ['teachers_id' => 'id']],
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
            'teachers_id' => Yii::t('yee/teachers', 'Teachers ID'),
            'main_flag' => Yii::t('yee/teachers', 'Main Flag'),
        ];
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
    public function getTeachers()
    {
        return $this->hasOne(Teachers::className(), ['id' => 'teachers_id']);
    }
}
