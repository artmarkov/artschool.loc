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
class Stake extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%teachers_stake}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
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
    public function getCosts()
    {
        return $this->hasMany(Cost::className(), ['stake_id' => 'id']);
    }

    public static function getStakeList()
    {
        return \yii\helpers\ArrayHelper::map(Stake::find()->all(), 'id', 'name');

    }
}
