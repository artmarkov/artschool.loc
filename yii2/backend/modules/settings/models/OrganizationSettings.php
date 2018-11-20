<?php

namespace backend\modules\settings\models;

use yeesoft\behaviors\MultilingualSettingsBehavior;
use yeesoft\settings\models\BaseSettingsModel;
use Yii;
use yii\helpers\ArrayHelper;

/**
 * @author Taras Makitra <makitrataras@gmail.com>
 *
 *  Yii::$app->settings->get('organization.head_sign'),
 */
class OrganizationSettings extends BaseSettingsModel
{
    const GROUP = 'organization';

    public $head;
    public $chief_accountant;
    public $head_sign;
    public $chief_accountant_sign;
    public $name;
    public $abbr_name;
    public $post;
    public $email;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return ArrayHelper::merge(parent::rules(),
            [
                [['head','head_sign','chief_accountant','chief_accountant_sign','name','abbr_name','post','email'], 'required'],
                ['email','email'],
                [['head','head_sign','chief_accountant','chief_accountant_sign','name','abbr_name','post','email'], 'string'],

            ]);
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'multilingualSettings' => [
                'class' => MultilingualSettingsBehavior::className(),
                'attributes' => [
                    'head','head_sign','chief_accountant','chief_accountant_sign','name','abbr_name','post'
                ]
            ],
        ];
    }
    public function attributeLabels()
    {
        return [
            'head' => Yii::t('yee/settings', 'Head'),
            'head_sign' => Yii::t('yee/settings', 'Head sign'),
            'chief_accountant' => Yii::t('yee/settings', 'Chief accountant'),
            'chief_accountant_sign' => Yii::t('yee/settings', 'Chief accountant sign'),
            'name' => Yii::t('yee/settings', 'Name organization'),
            'abbr_name' => Yii::t('yee/settings', 'Abbr name organization'),
            'post' => Yii::t('yee/settings', 'Post organization'),
            'email' => Yii::t('yee/settings', 'E-mail organization'),

        ];
    }

}
