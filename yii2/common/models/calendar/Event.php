<?php

namespace common\models\calendar;

use Yii;

/**
 * This is the model class for table "event".
 *
 * @property int $id
 * @property string $title
 * @property string $description
 * @property string $created_date
 */
class Event extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%event}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'description'], 'required'],
            [['description'], 'string'],
            [['start_timestamp', 'end_timestamp'], 'safe'],
            [['title'], 'string', 'max' => 100],
            ['start_timestamp', 'date', 'timestampAttribute' => 'start_timestamp', 'format' => 'dd-MM-yyyy H:m'],
            ['end_timestamp', 'date', 'timestampAttribute' => 'end_timestamp', 'format' => 'dd-MM-yyyy H:m'],
            [['start_timestamp', 'end_timestamp'], 'default', 'value' =>  mktime(date("H", time()), date("i", time()),0, date("m", time()), date("d", time()), date("Y", time()))],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/service', 'ID'),
            'title' => Yii::t('yee/service', 'Title'),
            'description' => Yii::t('yee/service', 'Description'),
            'start_timestamp' => Yii::t('yee/service', 'Start'),
            'end_timestamp' => Yii::t('yee/service', 'End'),
        ];
    }
}
