<?php

namespace common\models\teachers;

use Yii;

/**
 * This is the model class for table "{{%teachers_stake}}".
 *
 * @property int $id
 * @property string $name
 * @property string $slug
 *
 * @property TeachersCost[] $teachersCosts
 */
class Stake extends \yii\db\ActiveRecord {

    const STATUS_ACTIVE = 1;
    const STATUS_INACTIVE = 0;

    /**
     * {@inheritdoc}
     */
    public static function tableName() {
        return '{{%teachers_stake}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules() {
        return [
            [['name'], 'required'],
            ['status', 'integer'],
            [['name'], 'string', 'max' => 128],
            [['slug'], 'string', 'max' => 32],
            [['name', 'slug'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels() {
        return [
            'id' => Yii::t('yee/teachers', 'ID'),
            'name' => Yii::t('yee/teachers', 'Name'),
            'slug' => Yii::t('yee/teachers', 'Slug'),
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
    public function getCosts() {
        return $this->hasMany(Cost::className(), ['stake_id' => 'id']);
    }

    public static function getStakeList() {
        return \yii\helpers\ArrayHelper::map(Stake::find()->all(), 'id', 'name');
    }

}
