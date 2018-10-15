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
            [['direction_id', 'stake_id'], 'required'],
            [['direction_id', 'stake_id'], 'integer'],
            [['stake'], 'number'],
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
            'stake' => Yii::t('yee/teachers', 'Stake'),
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
    public function getStake0()
    {
        return $this->hasOne(Stake::className(), ['id' => 'stake_id']);
    }
}
