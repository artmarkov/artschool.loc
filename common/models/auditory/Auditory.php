<?php

namespace common\models\auditory;

use Yii;

/**
 * This is the model class for table "{{%auditory}}".
 *
 * @property int $id
 * @property int $building_id
 * @property int $cat_id
 * @property string $study_flag
 * @property int $num
 * @property string $name
 * @property string $slug
 * @property string $floor
 * @property double $area
 * @property int $capacity
 * @property string $description
 * @property int $order
 */
class Auditory extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%auditory}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['building_id', 'study_flag', 'floor', 'area', 'capacity', 'order'], 'required'],
            [['building_id', 'cat_id', 'num', 'capacity', 'order'], 'integer'],
            [['study_flag'], 'string'],
            [['area'], 'number'],
            [['name'], 'string', 'max' => 128],
            [['slug'], 'string', 'max' => 64],
            [['floor'], 'string', 'max' => 32],
            [['description'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/auditory', 'ID'),
            'building_id' => Yii::t('yee/auditory', 'Building ID'),
            'cat_id' => Yii::t('yee/auditory', 'Cat ID'),
            'study_flag' => Yii::t('yee/auditory', 'Study Flag'),
            'num' => Yii::t('yee/auditory', 'Num'),
            'name' => Yii::t('yee/auditory', 'Name'),
            'slug' => Yii::t('yee/auditory', 'Slug'),
            'floor' => Yii::t('yee/auditory', 'Floor'),
            'area' => Yii::t('yee/auditory', 'Area'),
            'capacity' => Yii::t('yee/auditory', 'Capacity'),
            'description' => Yii::t('yee/auditory', 'Description'),
            'order' => Yii::t('yee/auditory', 'Order'),
        ];
    }
    
     /**
     * @return \yii\db\ActiveQuery
     */
    public function getAuditoryCat()
    {
        return $this->hasOne(AuditoryCat::className(), ['id' => 'cat_id']);
        
    } 
    
    
    public function getAuditoryBuilding()
    {
        return $this->hasOne(AuditoryBuilding::className(), ['id' => 'building_id']);
    }
}
