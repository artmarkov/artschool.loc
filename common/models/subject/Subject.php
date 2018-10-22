<?php

namespace common\models\subject;

use Yii;

/**
 * This is the model class for table "{{%subject}}".
 *
 * @property int $id
 * @property string $name
 * @property string $slug
 * @property int $order
 * @property int $status
 *
 * @property SubjectCategory[] $subjectCategories
 * @property SubjectDepartment[] $subjectDepartments
 */
class Subject extends \yii\db\ActiveRecord
{
    const STATUS_ACTIVE = 1;
    const STATUS_INACTIVE = 0;
    
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%subject}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['order', 'status'], 'required'],
            [['order', 'status'], 'integer'],
            [['name'], 'string', 'max' => 64],
            [['slug'], 'string', 'max' => 32],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/guide', 'ID'),
            'name' => Yii::t('yee/guide', 'Name'),
            'slug' => Yii::t('yee/guide', 'Slug'),
            'order' => Yii::t('yee/guide', 'Order'),
            'status' => Yii::t('yee/guide', 'Status'),
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
    public function getSubjectCategories()
    {
        return $this->hasMany(SubjectCategory::className(), ['subject_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubjectDepartments()
    {
        return $this->hasMany(SubjectDepartment::className(), ['subject_id' => 'id']);
    }
}
