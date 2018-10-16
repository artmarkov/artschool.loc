<?php

use yeesoft\widgets\ActiveForm;
use common\models\teachers\Teachers;
use yeesoft\helpers\Html;
use kartik\date\DatePicker;

/* @var $this yii\web\View */
/* @var $model common\models\teachers\Teachers */
/* @var $form yeesoft\widgets\ActiveForm */
?>

<div class="teachers-form">

    <?php
    $form = ActiveForm::begin([
                'id' => 'teachers-form',
                'validateOnBlur' => false,
            ])
    ?>

    <div class="row">
        <div class="col-md-9">

            <div class="panel panel-default">
                <div class="panel-body">

                    <div class="row">
                        <div class="col-md-6">
                            <?= $form->field($model, 'timestamp_serv')->textInput()->hint(Yii::t('yee/teachers', 'Enter full year...')) ?>
                        </div>
                        <div class="col-md-6">
                            <?php
                            echo $form->field($model, 'time_serv_init')->widget(DatePicker::classname(), [
                                'options' => ['placeholder' => 'For date ...'],
                                'pluginOptions' => [
                                    'autoclose' => true,
                                    'format' => 'dd-mm-yyyy'
                                ]
                            ])->label(Yii::t('yee/teachers', 'For date'));
                            ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <?= $form->field($model, 'timestamp_serv_spec')->textInput()->hint(Yii::t('yee/teachers', 'Enter full year...')) ?>
                        </div>
                        <div class="col-md-6">
                            <?php
                            echo $form->field($model, 'time_serv_spec_init')->widget(DatePicker::classname(), [
                                'options' => ['placeholder' => 'For date ...'],
                                'pluginOptions' => [
                                    'autoclose' => true,
                                    'format' => 'dd-mm-yyyy'
                                ]
                            ])->label(Yii::t('yee/teachers', 'For date'));
                            ?>

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
                            <label class="control-label" style="float: left; padding-right: 5px;"><?= $model->attributeLabels()['id'] ?>: </label>
                            <span><?= $model->id ?></span>
                        </div>
                        <?php
                        echo $form->field($model, 'position_id')->dropDownList(common\models\teachers\Position::getPositionList(), [
                            'prompt' => Yii::t('yee/teachers', 'Select Position...'),
                            'id' => 'position_id'
                        ])->label(Yii::t('yee/teachers', 'Name Position'));
                        ?>

                        <?php
                        echo $form->field($model, 'work_id')->dropDownList(common\models\teachers\Work::getWorkList(), [
                            'prompt' => Yii::t('yee/teachers', 'Select Work...'),
                            'id' => 'work_id'
                        ])->label(Yii::t('yee/teachers', 'Name Work'));
                        ?>

                        <?php
                        echo $form->field($model, 'level_id')->dropDownList(common\models\teachers\Level::getLevelList(), [
                            'prompt' => Yii::t('yee/teachers', 'Select Level...'),
                            'id' => 'level_id'
                        ])->label(Yii::t('yee/teachers', 'Name Level'));
                        ?>
                        <?= $form->field($model, 'tab_num')->textInput(['maxlength' => true]) ?>

                        <div class="form-group">
                            <?php if ($model->isNewRecord): ?>
                                <?= Html::submitButton(Yii::t('yee', 'Create'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Cancel'), ['/teachers/default/index'], ['class' => 'btn btn-default']) ?>
                            <?php else: ?>
                                <?= Html::submitButton(Yii::t('yee', 'Save'), ['class' => 'btn btn-primary']) ?>
                                <?=
                                Html::a(Yii::t('yee', 'Delete'), ['/teachers/default/delete', 'id' => $model->id], [
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
