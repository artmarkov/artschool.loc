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
 */
class Teachers extends \yii\db\ActiveRecord
{
    public $time_serv_init;
    public $time_serv_spec_init;
    public $year_serv;
    public $year_serv_spec;

    public $direction_id_main;
    public $stake_id_main;
    public $direction_id_optional;
    public $stake_id_optional;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%teachers}}';
    }
    /**
     * Реализация поведения многое ко многим
     * @return  mixed
     */
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
            [['position_id', 'work_id', 'level_id', 'cost_main_id', 'cost_optional_id', 'timestamp_serv', 'timestamp_serv_spec'], 'integer'],
            [['position_id', 'work_id', 'level_id'], 'required'],
            [['cost_main_id', 'direction_id_main', 'stake_id_main'], 'required'],
            [['tab_num'], 'string', 'max' => 16],
            [['level_id'], 'exist', 'skipOnError' => true, 'targetClass' => Level::className(), 'targetAttribute' => ['level_id' => 'id']],
            [['position_id'], 'exist', 'skipOnError' => true, 'targetClass' => Position::className(), 'targetAttribute' => ['position_id' => 'id']],
            [['work_id'], 'exist', 'skipOnError' => true, 'targetClass' => Work::className(), 'targetAttribute' => ['work_id' => 'id']],
            [['cost_main_id'], 'exist', 'skipOnError' => true, 'targetClass' => Cost::className(), 'targetAttribute' => ['cost_main_id' => 'id']],
            [['cost_optional_id'], 'exist', 'skipOnError' => true, 'targetClass' => Cost::className(), 'targetAttribute' => ['cost_optional_id' => 'id']],
            [['bonus_list'], 'safe'],
            [['direction_id_main', 'stake_id_main', 'direction_id_optional', 'stake_id_optional'], 'integer'],
            [['year_serv', 'year_serv_spec', 'time_serv_init', 'time_serv_spec_init'], 'safe'],
            ['cost_main_id', 'compareCost'],
            ['year_serv', 'compareSpec'],
        ];
    }

    /**
     * Проверка на одинаковость полей direction_id_main и direction_id_optional
     * @return  mixed
     */
    public function compareCost()
    {
        if (!$this->hasErrors()) {

            if ($this->direction_id_main == $this->direction_id_optional) {
                $this->addError('direction_id_main', Yii::t('yee/teachers', 'The main activity may not be the same as the secondary one.'));
            }
        }
    }
     /**
     * Сравнение общего стажа со стажем по специальности
     * @return  mixed
     */
     public function compareSpec()
    {
        if (!$this->hasErrors()) {

            if ($this->year_serv < $this->year_serv_spec) {
                $this->addError('year_serv_spec', Yii::t('yee/teachers', 'Experience in the specialty can not be more than the total experience.'));
            }
        }
    }
    /**
     * Преобразование даты в timestamp
     */
    public static function getDateToTimestamp($mask = "-", $date) {
        $d_in = explode($mask, $date);
        return mktime(0, 0, 0, $d_in[1], $d_in[0], $d_in[2]);
    }

    /**
     * Преобразование timestamp в дату
     */
    public static function getTimestampToDate($mask = "d-m-Y", $timestamp) {
        return date($mask, $timestamp);
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
            'cost_main_id' => Yii::t('yee/teachers', 'Cost Main ID'),
            'cost_optional_id' => Yii::t('yee/teachers', 'Cost Optional ID'),
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
    public function getCostMain()
    {
        return $this->hasOne(Cost::className(), ['id' => 'cost_main_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCostOptional()
    {
        return $this->hasOne(Cost::className(), ['id' => 'cost_optional_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
  
    public function getBonusItem()
    {
        return $this->hasMany(BonusItem::className(), ['id' => 'bonus_item_id'])
            ->viaTable('teachers_bonus', ['teachers_id' => 'id']);
    }

    public static function getBonusItemList()
    {
        return ArrayHelper::map(BonusItem::find()
            ->innerJoin('teachers_bonus_category', 'teachers_bonus_category.id = teachers_bonus_item.bonus_category_id')
            ->andWhere(['teachers_bonus_item.status' => BonusItem::STATUS_ACTIVE])
            ->select('teachers_bonus_item.id as id, teachers_bonus_item.name as name, teachers_bonus_category.name as name_category')
            ->orderBy('teachers_bonus_item.bonus_category_id')
            ->addOrderBy('teachers_bonus_item.name')
            ->asArray()->all(), 'id', 'name', 'name_category');
    }

}
