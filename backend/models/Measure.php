<?php

namespace backend\models;

use yeesoft\eav\models\EavCategories;
use Yii;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "measure".
 *
 * @property int $id
 * @property string $name
 * @property string $abbr
 */
class Measure extends ActiveRecord implements EavCategories
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'measure';
    }
    public function behaviors()
    {
        return [
            'eav' => [
                'class' => \yeesoft\eav\EavBehavior::className(),
            ]
        ];
    }
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'string', 'max' => 64],
            [['abbr'], 'string', 'max' => 32],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee', 'ID'),
            'name' => Yii::t('yee', 'Name'),
            'abbr' => Yii::t('yee', 'Abbr'),
        ];
    }
    public function getEavCategories()
    {
        return false;
    }

    public static function getEavCategoryField()
    {
        return false;
    }

}
