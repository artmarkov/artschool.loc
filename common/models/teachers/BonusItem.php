<?php

namespace common\models\teachers;

use Yii;

/**
 * This is the model class for table "{{%teachers_bonus_item}}".
 *
 * @property int $id
 * @property int $bonus_category_id
 * @property string $name
 * @property string $slug
 * @property string $value_default
 * @property int $measure_id ед. измерения
 * @property int $bonus_rule_id правило обработки бонуса
 * @property int $status 1-активна, 0-удалена
 *
 * @property TeachersBonusCategory $bonusCategory
 */
class BonusItem extends \yii\db\ActiveRecord
{
    const STATUS_ACTIVE = 1;
    const STATUS_INACTIVE = 0;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%teachers_bonus_item}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['bonus_category_id', 'name', 'slug'], 'required'],
            [['bonus_category_id', 'measure_id', 'bonus_rule_id', 'status'], 'integer'],
            [['name', 'value_default'], 'string', 'max' => 127],
            [['slug'], 'string', 'max' => 32],
            [['bonus_category_id'], 'exist', 'skipOnError' => true, 'targetClass' => BonusCategory::className(), 'targetAttribute' => ['bonus_category_id' => 'id']],
            [['name','slug'], 'unique'],
        ];
    }
    /* Геттер для value + measure_id */

    public function getMeasureFullName() {
        return $this->value_default . ' ' . $this->measure_id;
    }
    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/teachers', 'ID'),
            'bonus_category_id' => Yii::t('yee/teachers', 'Bonus Category ID'),
            'name' => Yii::t('yee/teachers', 'Name'),
            'slug' => Yii::t('yee/teachers', 'Slug'),
            'value_default' => Yii::t('yee/teachers', 'Value Default'),
            'measure_id' => Yii::t('yee/teachers', 'Measure Id'),
            'bonus_rule_id' => Yii::t('yee/teachers', 'Bonus Rule Id'),
            'status' => Yii::t('yee/teachers', 'Status'),
        ];
    }
    /**
     * getStatusList
     * @return array
     */
    public static function getStatusList() {
        return array(
            self::STATUS_ACTIVE => Yii::t('yee', 'Active'),
            self::STATUS_INACTIVE => Yii::t('yee', 'Inactive'),
        );
    }
    /**
     * getStatusValue
     *
     * @param string $val
     *
     * @return string
     */
    public static function getStatusValue($val) {
        $ar = self::getStatusList();

        return isset($ar[$val]) ? $ar[$val] : $val;
    }
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBonusCategory()
    {
        return $this->hasOne(BonusCategory::className(), ['id' => 'bonus_category_id']);
    }
    /* Геттер для названия */
    public function getBonusCategoryName()
    {
        return $this->bonusCategory->name;
    }
}
