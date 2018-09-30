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
            [['name', 'description', 'study_flag', 'order'], 'required'],
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
            'id' => Yii::t('yee/auditory', 'ID'),
            'name' => Yii::t('yee/auditory', 'Name'),
            'description' => Yii::t('yee/auditory', 'Description'),
            'study_flag' => Yii::t('yee/auditory', 'Study Flag'),
            'order' => Yii::t('yee/auditory', 'Order'),
        ];
    }
    public function getAuditory()
    {
        return $this->hasMany(Auditory::className(), ['cat_id' => 'id']);
        
    }
   
}
