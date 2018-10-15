<?php

namespace common\models\teachers;

use Yii;

/**
 * This is the model class for table "{{%teachers_direction}}".
 *
 * @property int $id
 * @property string $name
 * @property string $slug
 *
 * @property Cost[] $teachersCosts
 * @property DirectionCost[] $teachersDirectionCosts
 */
class Direction extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%teachers_direction}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'string', 'max' => 128],
            [['slug'], 'string', 'max' => 32],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/teachers', 'ID'),
            'name' => Yii::t('yee/teachers', 'Name'),
            'slug' => Yii::t('yee/teachers', 'Slug'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTeachersCosts()
    {
        return $this->hasMany(Cost::className(), ['direction_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTeachersDirectionCosts()
    {
        return $this->hasMany(DirectionCost::className(), ['direction_id' => 'id']);
    }
}
