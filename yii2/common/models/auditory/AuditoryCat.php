<?php

namespace common\models\auditory;

use Yii;

/**
 * This is the model class for table "{{%auditory_cat}}".
 *
 * @property int $id
 * @property string $name
 * @property string $description
 * @property string $study_flag
 * @property int $order
 */
class AuditoryCat extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%auditory_cat}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'study_flag'], 'required'],
            [['study_flag'], 'string'],
            [['order'], 'integer'],
            [['name'], 'string', 'max' => 128],
            [['description'], 'string', 'max' => 256],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/guide', 'ID'),
            'name' => Yii::t('yee/guide', 'Name Auditory Category'),
            'description' => Yii::t('yee/guide', 'Description Auditory Category'),
            'study_flag' => Yii::t('yee/guide', 'Study Opportunity'),
            'order' => Yii::t('yee/guide', 'Order'),
        ];
    }
    public function getAuditory()
    {
        return $this->hasMany(Auditory::className(), ['cat_id' => 'id']);
        
    }

    public static function getAuditoryCatList()
    {
      return  AuditoryCat::find()->select(['name', 'id'])->indexBy('id')->column();
    }
   
}
