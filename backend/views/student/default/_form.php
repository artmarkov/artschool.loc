<?php

use yeesoft\widgets\ActiveForm;
use common\models\student\Student;
use yeesoft\helpers\Html;
use yii\widgets\MaskedInput;
use lo\widgets\modal\ModalAjax;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model common\models\student\Student */
/* @var $form yeesoft\widgets\ActiveForm */
?>
<?php
$modal = ModalAjax::widget([
    'id' => 'createParents',
    'header' => 'Create Parent',
    'toggleButton' => [
        'label' => 'Create Parent',
        'class' => 'btn btn-primary'
    ],
    'url' => Url::to(['/parents/create?user_id=' . $modelUser->id]), // Ajax view with form to load
    'ajaxSubmit' => true,
    'size' => ModalAjax::SIZE_LARGE,
    'autoClose' => true,
    'pjaxContainer' => '#grid-parent-pjax',
]);
?>
<?= $modal;?>
<div class="student-form">

  
    <?php $form = ActiveForm::begin(); ?>
   

    <div class="row">
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-body">

                    <div class="row">
                        <div class="col-md-4">
                            <?= $form->field($modelUser, 'last_name')->textInput(['maxlength' => 124]) ?>
                        </div>
                        <div class="col-md-4">
                            <?= $form->field($modelUser, 'first_name')->textInput(['maxlength' => 124]) ?>
                        </div>
                        <div class="col-md-4">
                            <?= $form->field($modelUser, 'middle_name')->textInput(['maxlength' => 124]) ?>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <?= $form->field($modelUser, 'gender')->dropDownList(yeesoft\models\User::getGenderList()) ?>
                        </div>
                        <div class="col-md-3">
                            <?= $form->field($modelUser, 'birth_date')->widget(MaskedInput::className(), ['mask' => '99-99-9999',])->textInput() ?>
                        </div>
                        <div class="col-md-3">
                            <?= $form->field($modelUser, 'snils')->widget(MaskedInput::className(), ['mask' => '999-999-999 99',])->textInput() ?>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <?= $form->field($modelUser, 'phone')->widget(MaskedInput::className(), ['mask' => '+7 (999) 999 99 99',])->textInput() ?>
                        </div>
                        <div class="col-md-6">
                            <?= $form->field($modelUser, 'phone_optional')->widget(MaskedInput::className(), ['mask' => '+7 (999) 999 99 99',])->textInput() ?>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-9">
                            <?= $form->field($model, 'sertificate_name')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-md-3">
                            <?= $form->field($model, 'sertificate_date')->widget(MaskedInput::className(), ['mask' => '99-99-9999',])->textInput() ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <?= $form->field($model, 'sertificate_series')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-md-3">
                            <?= $form->field($model, 'sertificate_num')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-md-6">
                            <?= $form->field($model, 'sertificate_organ')->textInput(['maxlength' => true]) ?>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">

                            <p>      
                                
                            </p>                          

                            
                            
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
                            <label class="control-label"
                                   style="float: left; padding-right: 5px;"><?= $model->attributeLabels()['id'] ?>
                                : </label>
                            <span><?= $model->id ?></span>
                        </div>

                        <?php
                        echo $form->field($model, 'position_id')->dropDownList(\common\models\student\StudentPosition::getPositionList(), [
                            'prompt' => Yii::t('yee/student', 'Select Position...'),
                            'id' => 'position_id'
                        ])->label(Yii::t('yee/student', 'Name Position'));
                        ?>

                        <div class="form-group">
                            <?php if ($model->isNewRecord): ?>
                                <?= Html::submitButton(Yii::t('yee', 'Create'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Cancel'), ['/student/default/index'], ['class' => 'btn btn-default']) ?>
                            <?php else: ?>
                                <?= Html::submitButton(Yii::t('yee', 'Save'), ['class' => 'btn btn-primary']) ?>
                                <?=
                                Html::a(Yii::t('yee', 'Delete'), ['/student/default/delete', 'id' => $model->id], [
                                    'class' => 'btn btn-default',
                                    'data' => [
                                        'confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                                        'method' => 'post',
                                    ],
                                ])
                                ?>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
