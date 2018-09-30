<?php

namespace common\models\auditory;

use Yii;

/**
 * This is the model class for table "{{%auditory_building}}".
 *
 * @property int $id
 * @property string $name
 * @property string $slug
 * @property string $address
 */
class AuditoryBuilding extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%auditory_building}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'slug', 'address'], 'required'],
            [['name'], 'string', 'max' => 128],
            [['slug'], 'string', 'max' => 64],
            [['address'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/auditory', 'ID'),
            'name' => Yii::t('yee/auditory', 'Name'),
            'slug' => Yii::t('yee/auditory', 'Slug'),
            'address' => Yii::t('yee/auditory', 'Address'),
        ];
    }
    public function getAuditory()
    {
        return $this->hasMany(Auditory::className(), ['building_id' => 'id']);
        
    }
}
