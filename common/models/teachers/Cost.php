<?php

namespace common\models\teachers;

use Yii;

/**
 * This is the model class for table "{{%teachers_cost}}".
 *
 * @property int $id
 * @property int $direction_id
 * @property int $stake_id
 * @property double $stake
 *
 * @property TeachersDirection $direction
 * @property TeachersStake $stake0
 */
class Cost extends \yii\db\ActiveRecord
{

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%teachers_cost}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['direction_id', 'stake_id', 'stake_value'], 'required'],
            [['direction_id', 'stake_id'], 'integer'],
            ['direction_id', 'unique', 'targetAttribute' => ['direction_id', 'stake_id']], // проверка уникальности пары
            [['stake_value'], 'number'],
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
            'stake_value' => Yii::t('yee/teachers', 'Stake Value'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDirection()
    {
        return $this->hasOne(Direction::className(), ['id' => 'direction_id']);
    }
    /* Геттер для названия */
    public function getDirectionName()
    {
        return $this->direction->name;
    }
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStake()
    {
        return $this->hasOne(Stake::className(), ['id' => 'stake_id']);
    }
    /* Геттер для названия */
    public function getStakeName()
    {
        return $this->stake->name;
    }
     /* Геттер для названия */
    public function getStakeSlug()
    {
        return $this->stake->slug;
    }
}
