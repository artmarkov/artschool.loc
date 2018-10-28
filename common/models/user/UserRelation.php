<?php

namespace common\models\user;

use Yii;

/**
 * This is the model class for table "{{%user_relation}}".
 *
 * @property int $id
 * @property string $name
 * @property string $slug
 *
 * @property UserFamily[] $userFamilies
 */
class UserRelation extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%user_relation}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
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
            'id' => Yii::t('yee/user', 'ID'),
            'name' => Yii::t('yee/user', 'Name'),
            'slug' => Yii::t('yee/user', 'Slug'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserFamilies()
    {
        return $this->hasMany(UserFamily::className(), ['relation_id' => 'id']);
    }
}
