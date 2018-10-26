<?php

namespace common\models\student;

use Yii;

/**
 * This is the model class for table "{{%student_position}}".
 *
 * @property int $id
 * @property string $name
 * @property string $slug
 *
 * @property Student[] $students
 */
class StudentPosition extends \yii\db\ActiveRecord
{
    
    const STATUS_ACTIVE = 1;
    const STATUS_INACTIVE = 0;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%student_position}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'string', 'max' => 128],
            [['slug'], 'string', 'max' => 32],
            ['status', 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/student', 'ID'),
            'name' => Yii::t('yee/student', 'Name'),
            'slug' => Yii::t('yee/student', 'Slug'),
            'status' => Yii::t('yee/student', 'Status'),
        ];
    }
 /**
     * getStatusList
     * @return array
     */
    public static function getStatusList()
    {
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
    public static function getStatusValue($val)
    {
        $ar = self::getStatusList();

        return isset($ar[$val]) ? $ar[$val] : $val;
    }
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStudents()
    {
        return $this->hasMany(Student::className(), ['position_id' => 'id']);
    }
}
