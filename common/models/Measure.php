<?php

namespace common\models;

use yeesoft\eav\models\EavCategories;
use Yii;
use yii\db\ActiveRecord;
use yeesoft\eav\EavBehavior;

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
                'class' => EavBehavior::className(),
            ]
        ];
    }
    /**
     * {@inheritdoc}
     */


    public function rules()
    {
        return  [
                [['name'], 'required'],
                [['name'], 'string', 'max' => 64],
                [['abbr'], 'string', 'max' => 32],
                [['field_1','field_2'], 'required'],

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

    public function getEavAttributesViewList($model)
    {
        $items = array();
        foreach ($model->getEavAttributes() as $attr) {
            $items[] = array(
                'label' => $model->getEavAttribute($attr)->label,
                'value' => $model->owner->$attr,
            );
        }
        return $items;
    }

    public function getEavAttributesIndexList($model)
    {
        $items = array();
        foreach ($model->getEavAttributes() as $attr) {
            if($model->getEavAttribute($attr)->visible === 1) {
                $items[] = array(
                    'attribute' => $model->getEavAttribute($attr)->name,
                    'label' => $model->getEavAttribute($attr)->label,

                );
            }
        }
        return $items;
    }

   /* public function getEavAttributesRules($model)
    {
        $items = array();
        foreach ($model->getEavAttributes() as $attr) {
            $items[] = array(
                $model->getEavAttribute($attr)->name, 'required'
            );
        }
        return $items;
    }*/
}
