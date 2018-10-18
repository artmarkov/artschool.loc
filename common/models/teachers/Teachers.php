<?php

namespace common\models\teachers;

use Yii;
use yii\helpers\ArrayHelper;
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
    public $time_serv_init;
    public $time_serv_spec_init;
    
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%teachers}}';
    }

    public function behaviors()
    {
        return [
            [
                'class' => \common\components\behaviors\ManyHasManyBehavior::className(),
                'relations' => [
                    'bonusItem' => 'bonus_list',
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['position_id', 'work_id', 'level_id', 'timestamp_serv', 'timestamp_serv_spec'], 'integer'],
            [['position_id', 'work_id', 'level_id'], 'required'],
            [['tab_num'], 'string', 'max' => 16],
            [['level_id'], 'exist', 'skipOnError' => true, 'targetClass' => Level::className(), 'targetAttribute' => ['level_id' => 'id']],
            [['position_id'], 'exist', 'skipOnError' => true, 'targetClass' => Position::className(), 'targetAttribute' => ['position_id' => 'id']],
            [['work_id'], 'exist', 'skipOnError' => true, 'targetClass' => Work::className(), 'targetAttribute' => ['work_id' => 'id']],
            [['bonus_list'], 'safe'],
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
            'bonus_list' => Yii::t('yee/teachers', 'Bonus List'),
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

    public function getBonusItem()
    {
        return $this->hasMany(BonusItem::className(), ['id' => 'bonus_item_id'])
            ->viaTable('teachers_bonus', ['teachers_id' => 'id']);
    }
    public static function getBonusItemList()
    {
       return ArrayHelper::map(BonusItem::find()
               ->innerJoin('teachers_bonus_category','teachers_bonus_category.id = teachers_bonus_item.bonus_category_id')
               ->andWhere(['teachers_bonus_item.status' => BonusItem::STATUS_ACTIVE])
               ->select('teachers_bonus_item.id as id, teachers_bonus_item.name as name, teachers_bonus_category.name as name_category')
               ->orderBy('teachers_bonus_item.bonus_category_id')
               ->addOrderBy('teachers_bonus_item.name')
               ->asArray()->all(), 'id' ,'name', 'name_category');
    }
}
