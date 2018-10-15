<?php

namespace common\models\teachers;

use Yii;

/**
 * This is the model class for table "{{%teachers_work}}".
 *
 * @property int $id
 * @property string $name
 * @property string $slug
 *
 * @property Teachers[] $teachers
 */
class Work extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%teachers_work}}';
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
    public function getTeachers()
    {
        return $this->hasMany(Teachers::className(), ['work_id' => 'id']);
    }
}
