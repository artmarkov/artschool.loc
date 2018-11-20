<?php

use yeesoft\helpers\Html;
use yeesoft\settings\assets\SettingsAsset;
use common\widgets\ActiveForm;
use yeesoft\widgets\LanguagePills;

/* @var $this yii\web\View */
/* @var $model yeesoft\models\Setting */
/* @var $form yeesoft\widgets\ActiveForm */

$this->title = Yii::t('yee/settings', 'Organization details');
$this->params['breadcrumbs'][] = $this->title;

SettingsAsset::register($this);
?>
<div class="setting-index">

    <div class="row">
        <div class="col-lg-8"><h3 class="lte-hide-title page-title"><?= Html::encode($this->title) ?></h3></div>
        <div class="col-lg-4"><?= LanguagePills::widget() ?></div>
    </div>

    <div class="setting-form">
        <?php
        $form = ActiveForm::begin([
            'id' => 'setting-form',
            'validateOnBlur' => false,
            'fieldConfig' => [
                'template' => "<div class=\"settings-group\"><div class=\"settings-label\">{label}</div>\n<div class=\"settings-field\">{input}\n{hint}\n{error}</div></div>"
            ],
        ])
        ?>

        <?= $form->field($model, 'name')->textInput(['maxlength' => true])->hint($model->getDescription('name')) ?>
        <?= $form->field($model, 'abbr_name')->textInput(['maxlength' => true])->hint($model->getDescription('abbr_name')) ?>
        <?= $form->field($model, 'post')->textInput(['maxlength' => true])->hint($model->getDescription('post')) ?>
        <?= $form->field($model, 'email')->textInput(['maxlength' => true])->hint($model->getDescription('email')) ?>
        <?= $form->field($model, 'head')->textInput(['maxlength' => true])->hint($model->getDescription('head')) ?>
        <?= $form->field($model, 'head_sign')->textInput(['maxlength' => true])->hint($model->getDescription('head_sign')) ?>
        <?= $form->field($model, 'chief_accountant')->textInput(['maxlength' => true])->hint($model->getDescription('chief_accountant')) ?>
        <?= $form->field($model, 'chief_accountant_sign')->textInput(['maxlength' => true])->hint($model->getDescription('chief_accountant_sign')) ?>

        <div class="form-group">
            <?= Html::submitButton(Yii::t('yee', 'Save'), ['class' => 'btn btn-primary']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>
</div>


