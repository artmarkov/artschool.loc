<?php

namespace common\models\service;

use Yii;

/**
 * This is the model class for table "{{%book}}".
 *
 * @property int $id
 * @property string $name
 * @property int $buy_amount
 * @property int $color
 */
class Book extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%book}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'buy_amount'], 'required'],
            [['name', 'buy_amount', 'color'], 'safe'],
            [['buy_amount'], 'number', 'min' => 0, 'max' => 5000],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/service', 'ID'),
            'name' => Yii::t('yee/service', 'Name'),
            'buy_amount' => Yii::t('yee/service', 'Buy Amount'),
            'color' => Yii::t('yee/service', 'Color'),
        ];
    }
}
