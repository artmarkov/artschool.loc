<?php

namespace backend\modules\settings\models;

use yeesoft\settings\models\BaseSettingsModel;
use Yii;
use yii\helpers\ArrayHelper;

/**
 * @author Taras Makitra <makitrataras@gmail.com>
 */
class ReadingSettings extends BaseSettingsModel
{
    const GROUP = 'reading';

    public $page_size;
    public $phone_mask;
    public $date_mask;
    public $time_mask;
    public $snils_mask;
    public $coordinate_mask;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return ArrayHelper::merge(parent::rules(),
            [
                [['page_size', 'phone_mask', 'date_mask', 'time_mask', 'snils_mask', 'coordinate_mask'], 'required'],
                [['page_size'], 'integer'],
                [['phone_mask', 'date_mask', 'time_mask', 'snils_mask', 'coordinate_mask'], 'string'],
                ['page_size', 'default', 'value' => 10],
        ]);
    }

    public function attributeLabels()
    {
        return [
            'page_size' => Yii::t('yee/settings', 'Page Size'),
            'date_mask' => Yii::t('yee/settings', 'Date Mask'),
            'time_mask' => Yii::t('yee/settings', 'Time Mask'),
            'snils_mask' => Yii::t('yee/settings', 'Snils Mask'),
            'coordinate_mask' => Yii::t('yee/settings', 'Coordinate Mask'),
        ];
    }

}