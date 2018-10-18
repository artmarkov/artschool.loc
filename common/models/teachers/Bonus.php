<?php

namespace common\models\teachers;

use Yii;

/**
 * This is the model class for table "{{%teachers_bonus}}".
 *
 * Организация связи many2many с моделями teachers & bonus_item
 *
 * @property int $id
 * @property int $teachers_id
 * @property int $bonus_item_id

 * @property Bonus $bonusItem
 * @property Bonus[] $teachersBonuses
 */
class Bonus extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%teachers_bonus}}';
    }

    public function rules()
    {
        return [
            [['teachers_id', 'bonus_item_id'], 'integer'],
            [['teachers_id', 'bonus_item_id'], 'required'],
            [['bonus_item_id'], 'exist', 'skipOnError' => true, 'targetClass' => Bonus::className(), 'targetAttribute' => ['bonus_item_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/teachers', 'ID'),
            'teachers_id' => Yii::t('yee/teachers', 'Teachers ID'),
            'bonus_item_id' => Yii::t('yee/teachers', 'Bonus Item ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBonusItem()
    {
        return $this->hasOne(Bonus::className(), ['id' => 'bonus_item_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBonuses()
    {
        return $this->hasMany(Bonus::className(), ['bonus_item_id' => 'id']);
    }
}
