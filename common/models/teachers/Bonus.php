<?php

namespace common\models\teachers;

use Yii;
use yeesoft\models\User;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\TimestampBehavior;
/**
 * This is the model class for table "{{%teachers_bonus}}".
 *
 * @property int $id
 * @property int $teachers_id
 * @property int $bonus_item_id
 * @property int $created_at
 * @property int $updated_at
 * @property int $created_by
 * @property int $apdated_by
 *
 * @property User $apdatedBy
 * @property User $createdBy
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
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
            BlameableBehavior::className(),
        ];
    }
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['teachers_id', 'bonus_item_id'], 'integer'],
            [['bonus_item_id'], 'required'],
//            [['updated_by'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['updated_by' => 'id']],
//            [['created_by'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['created_by' => 'id']],
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
            'created_at' => Yii::t('yee', 'Created At'),
            'updated_at' => Yii::t('yee', 'Updated At'),
            'created_by' => Yii::t('yee', 'Created By'),
            'updated_by' => Yii::t('yee', 'Updated By'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUpdatedBy()
    {
        return $this->hasOne(User::className(), ['id' => 'updated_by']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCreatedBy()
    {
        return $this->hasOne(User::className(), ['id' => 'created_by']);
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
