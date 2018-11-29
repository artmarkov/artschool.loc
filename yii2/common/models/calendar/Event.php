<?php

namespace common\models\calendar;

use Yii;

/**
 * This is the model class for table "event".
 *
 * @property int $id
 * @property int $all_day
 * @property string $title
 * @property string $description
 * @property string $start_timestamp
 * @property string $end_timestamp
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
            ['title', 'required'],
            [['start_timestamp', 'end_timestamp'], 'required'],
            [['description'], 'string'],
            [['start_timestamp', 'end_timestamp','all_day'], 'safe'],
            ['title', 'string', 'max' => 100],
            [['start_timestamp', 'end_timestamp'], 'default', 'value' =>  mktime(date("H", time()), date("i", time()),0, date("m", time()), date("d", time()), date("Y", time()))],
            ['start_timestamp', 'compareTimestamp'],
            ];
    }
    /**
     * сравнение даты начала и окончания/ дата окончания должна быть меньше даты начала
     */
    public function compareTimestamp()
    {
        if (!$this->hasErrors()) {

            if ($this->end_timestamp < $this->start_timestamp) {
                $this->addError('start_timestamp', Yii::t('yee/calendar', 'The event start date must be greater than the end date.'));
            }
        }
    }
    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/calendar', 'ID'),
            'title' => Yii::t('yee/calendar', 'Title'),
            'description' => Yii::t('yee/calendar', 'Description'),
            'start_timestamp' => Yii::t('yee/calendar', 'Start Date'),
            'end_timestamp' => Yii::t('yee/calendar', 'End Date'),
            'all_day' => Yii::t('yee/calendar', 'All Day'),
        ];
    }
}
