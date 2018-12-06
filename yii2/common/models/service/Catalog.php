<?php

namespace common\models\service;
use creocoder\nestedsets\NestedSetsBehavior;
use Yii;

/**
 * This is the model class for table "{{%catalog}}".
 *
 * @property int $id
 * @property int $tree
 * @property int $lft
 * @property int $rgt
 * @property int $depth
 * @property string $name
 * @property string $url
 * @property string $text
 */
class Catalog extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%catalog}}';
    }
    public function behaviors() {
        return [
            'tree' => [
                'class' => NestedSetsBehavior::className(),
            ],
            'htmlTree'=>[
                'class' => \wokster\treebehavior\NestedSetsTreeBehavior::className()
            ]
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'url'], 'required'],
            [['lft', 'rgt', 'depth'], 'integer'],
            [['lft', 'rgt', 'depth'], 'safe'],
            [['name'], 'string', 'max' => 255],
            [['url'], 'string', 'max' => 64],
            [['text'], 'string', 'max' => 127],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/service', 'ID'),
            //'tree' => Yii::t('yee/service', 'Tree'),
            'lft' => Yii::t('yee/service', 'Lft'),
            'rgt' => Yii::t('yee/service', 'Rgt'),
            'depth' => Yii::t('yee/service', 'Depth'),
            'name' => Yii::t('yee/service', 'Name'),
            'url' => Yii::t('yee/service', 'Url'),
            'text' => Yii::t('yee/service', 'Text'),
        ];
    }

    /**
     * {@inheritdoc}
     * @return CatalogQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CatalogQuery(get_called_class());
    }
    
     public function transactions()
    {
        return [
            self::SCENARIO_DEFAULT => self::OP_ALL,
        ];
    }

}
