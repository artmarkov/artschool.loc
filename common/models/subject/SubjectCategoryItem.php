<?php

namespace common\models\subject;

use Yii;

/**
 * This is the model class for table "{{%subject_category_item}}".
 *
 * @property int $id
 * @property string $name
 * @property string $slug
 * @property int $order
 *
 * @property SubjectCategory[] $subjectCategories
 */
class SubjectCategoryItem extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%subject_category_item}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['slug', 'order'], 'required'],
            [['order'], 'integer'],
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
            'order' => Yii::t('yee/guide', 'Order'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubjectCategories()
    {
        return $this->hasMany(SubjectCategory::className(), ['category_id' => 'id']);
    }
}
