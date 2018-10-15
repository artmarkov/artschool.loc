<?php

namespace common\models\teachers;

use Yii;

/**
 * This is the model class for table "{{%teachers}}".
 *
 * @property int $id
 * @property int $position_id
 * @property int $work_id
 * @property int $level_id
 * @property string $tab_num
 * @property int $timestamp_serv
 * @property int $timestamp_serv_spec
 *
 * @property TeachersLevel $level
 * @property TeachersPosition $position
 * @property TeachersWork $work
 * @property TeachersDirectionCost[] $teachersDirectionCosts
 */
class Teachers extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%teachers}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['position_id', 'work_id', 'level_id', 'timestamp_serv', 'timestamp_serv_spec'], 'integer'],
            [['tab_num'], 'string', 'max' => 16],
            [['level_id'], 'exist', 'skipOnError' => true, 'targetClass' => Level::className(), 'targetAttribute' => ['level_id' => 'id']],
            [['position_id'], 'exist', 'skipOnError' => true, 'targetClass' => Position::className(), 'targetAttribute' => ['position_id' => 'id']],
            [['work_id'], 'exist', 'skipOnError' => true, 'targetClass' => Work::className(), 'targetAttribute' => ['work_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/teachers', 'ID'),
            'position_id' => Yii::t('yee/teachers', 'Position ID'),
            'work_id' => Yii::t('yee/teachers', 'Work ID'),
            'level_id' => Yii::t('yee/teachers', 'Level ID'),
            'tab_num' => Yii::t('yee/teachers', 'Tab Num'),
            'timestamp_serv' => Yii::t('yee/teachers', 'Timestamp Serv'),
            'timestamp_serv_spec' => Yii::t('yee/teachers', 'Timestamp Serv Spec'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLevel()
    {
        return $this->hasOne(Level::className(), ['id' => 'level_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPosition()
    {
        return $this->hasOne(Position::className(), ['id' => 'position_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWork()
    {
        return $this->hasOne(Work::className(), ['id' => 'work_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDirectionCosts()
    {
        return $this->hasMany(DirectionCost::className(), ['teachers_id' => 'id']);
    }
}
