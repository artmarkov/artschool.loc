<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model common\models\service\Catalog */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="catalog-form">

    <?php $form = ActiveForm::begin([
        'action' => $model->isNewRecord ? Url::toRoute(['/service/catalog/create']) : 
        Url::toRoute(['/service/catalog/update', 'id' => $model->id])
        
    ]); ?>

    <?//= $form->field($model, 'tree')->dropDownList([1]) ?>

    <?//= $form->field($model, 'tree')->dropDownList(['корень']) ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'url')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'text')->textarea() ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('yee/service', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
