<?php

namespace common\models\subject;

use Yii;

/**
 * This is the model class for table "{{%subject_type}}".
 *
 * @property int $id
 * @property string $name
 * @property string $slug
 * @property int $status
 */
class SubjectType extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%subject_type}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'slug', 'status'], 'required'],
            [['status'], 'integer'],
            [['name'], 'string', 'max' => 127],
            [['slug'], 'string', 'max' => 64],
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
            'status' => Yii::t('yee/guide', 'Status'),
        ];
    }
}
