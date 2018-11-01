<?php

use yeesoft\widgets\ActiveForm;
use common\models\user\UserCommon;
use yeesoft\helpers\Html;
use yii\widgets\MaskedInput;

/* @var $this yii\web\View */
/* @var $model common\models\user\UserCommon */
/* @var $form yeesoft\widgets\ActiveForm */
?>

<div class="parents-form">

    <?php 
    $form = ActiveForm::begin([
            'id' => 'parents-form',
            'validateOnBlur' => false,
        ])
    ?>

   <div class="row">
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-body">

                    <div class="row">
                        <div class="col-md-4">
                            <?= $form->field($model, 'last_name')->textInput(['maxlength' => 124]) ?>
                        </div>
                        <div class="col-md-4">
                            <?= $form->field($model, 'first_name')->textInput(['maxlength' => 124]) ?>
                        </div>
                        <div class="col-md-4">
                            <?= $form->field($model, 'middle_name')->textInput(['maxlength' => 124]) ?>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <?= $form->field($model, 'gender')->dropDownList(yeesoft\models\User::getGenderList()) ?>
                        </div>
                        <div class="col-md-3">
                            <?= $form->field($model, 'birth_date')->widget(MaskedInput::className(), ['mask' => '99-99-9999',])->textInput() ?>
                        </div>
                        <div class="col-md-3">
                            <?= $form->field($model, 'snils')->widget(MaskedInput::className(), ['mask' => '999-999-999 99',])->textInput() ?>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <?= $form->field($model, 'phone')->widget(MaskedInput::className(), ['mask' => '+7 (999) 999 99 99',])->textInput() ?>
                        </div>
                        <div class="col-md-6">
                            <?= $form->field($model, 'phone_optional')->widget(MaskedInput::className(), ['mask' => '+7 (999) 999 99 99',])->textInput() ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">

            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="record-info">
                        <div class="form-group clearfix">
                            <label class="control-label" style="float: left; padding-right: 5px;"><?=  $model->attributeLabels()['id'] ?>: </label>
                            <span><?=  $model->id ?></span>
                        </div>

                        <div class="form-group">
                            <?php  if ($model->isNewRecord): ?>
                                <?= Html::submitButton(Yii::t('yee', 'Create'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Cancel'), ['/parents/default/index'], ['class' => 'btn btn-default']) ?>
                            <?php  else: ?>
                                <?= Html::submitButton(Yii::t('yee', 'Save'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Delete'),
                                    ['/parents/default/delete', 'id' => $model->id], [
                                    'class' => 'btn btn-default',
                                    'data' => [
                                        'confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                                        'method' => 'post',
                                    ],
                                ]) ?>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <?php  ActiveForm::end(); ?>

</div>
