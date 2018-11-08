<?php

use yeesoft\widgets\ActiveForm;
use common\models\student\Student;
use yeesoft\helpers\Html;
use yii\widgets\MaskedInput;
use kartik\select2\Select2;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model common\models\student\Student */
/* @var $form yeesoft\widgets\ActiveForm */
?>

<?//= \backend\widgets\ParentsAddWidget::widget([]); ?>

<div class="student-form">


    <?php $form = ActiveForm::begin([
        'id' => 'student-form',
        'validateOnBlur' => false,
        'enableAjaxValidation' => true,
        'options' => ['enctype' => 'multipart/form-data']
    ]);
    ?>


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
                            <?= $form->field($modelUser, 'birth_date')->widget(MaskedInput::className(), [
                                'mask' => '99-99-9999',
                                'options' => [
                                    'class' => 'form-control',
                                    'id' => 'birth_date_1'
                                ],
                                'clientOptions' => [
                                    'clearIncomplete' => true
                                ]
                            ]) ?>
                        </div>
                        <div class="col-md-3">
                            <?= $form->field($modelUser, 'snils')->widget(MaskedInput::className(), [
                            'mask' => '999-999-999 99',
                            'options' => [
                            'class' => 'form-control',
                            'id' => 'snils_1'
                            ],
                            'clientOptions' => [
                            'clearIncomplete' => true
                            ]
                            ]) ?>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <?= $form->field($modelUser, 'phone')->widget(MaskedInput::className(), [
                                'mask' => '+7 (999) 999 99 99',
                                'options' => [
                                    'class' => 'form-control',
                                    'id' => 'phone_1'
                                ],
                                'clientOptions' => [
                                    'clearIncomplete' => true
                                ]
                            ]) ?>
                        </div>
                        <div class="col-md-6">
                            <?= $form->field($modelUser, 'phone_optional')->widget(MaskedInput::className(), [
                                'mask' => '+7 (999) 999 99 99',
                                'options' => [
                                    'class' => 'form-control',
                                    'id' => 'phone_optional_1'
                                ],
                                'clientOptions' => [
                                    'clearIncomplete' => true
                                ]
                            ]) ?>
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

            <?php if (!$model->isNewRecord) : ?>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6">
                                <!--<label class="control-label">Family</label>-->
                                <?// = Select2::widget(
//                                    [
//                                        'name' => 'family_list',
//                                        'data' => Student::getFamilyList($modelUser->id),
//                                        'theme' => Select2::THEME_KRAJEE,
//                                        'options' => ['placeholder' => Yii::t('yee/student', 'Select Family...')],
//                                        'pluginOptions' => [
//                                            'allowClear' => true,
//                                        ],
//                                        'addon' => [
//                                            'append' => [
//                                                'content' => Html::a(Yii::t('yee', 'Add Parent'), ['#'],
//                                                [
//                                                    'class' => 'btn btn-primary',
//                                                    'data-toggle' => 'modal',
//                                                    'data-target' => '#parent-modal',
//                                                ]),
//                                                'asButton' => true,
//                                            ],
//                                        ],
//                                    ]);
                                ?>
                                <?= $form->field($model, 'family_list')->widget(Select2::classname(),
                                    [
                                        
                                        'data' => \common\models\user\UserCommon::getUserParentList(),
                                        'theme' => Select2::THEME_KRAJEE,
                                        'options' => ['placeholder' => Yii::t('yee/student', 'Select Family...')],
                                        'pluginOptions' => [
                                            'allowClear' => true,
                                        ],
                                        'addon' => [
                                            'append' => [
                                                'content' => Html::a(Yii::t('yee', 'Add Parent'), ['/parent/default/add-family','id' => $modelUser->id],
                                                    [
                                                        'class' => 'btn btn-primary add-to-family',
                                                        'data-id' => $modelUser->id,
                                                    ]),
                                                'asButton' => true,
                                            ],
                                        ],
                                    ]);
                                ?>
                            </div>
                            <!-- <div class="col-md-6">
                                <? /*= Html::a(Yii::t('yee', 'Add Parent'), ['#'], [
                                    'class' => 'btn btn-primary',
                                    'data-toggle' => 'modal',
                                    'data-target' => '#parent-modal',
                                ])
                                */ ?>
                        </div>-->
                        </div>
                    </div>
                </div>
            <?php endif; ?>

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
