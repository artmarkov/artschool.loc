<?php

use yeesoft\widgets\ActiveForm;
use common\models\student\Student;
use yeesoft\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\student\Student */
/* @var $form yeesoft\widgets\ActiveForm */
?>

<div class="student-form">

    <?php 
    $form = ActiveForm::begin([
            'id' => 'student-form',
            'validateOnBlur' => false,
        ])
    ?>

    <div class="row">
        <div class="col-md-9">

            <div class="panel panel-default">
                <div class="panel-body">
                    
                    <?= $form->field($model, 'position_id')->textInput() ?>

                    <?= $form->field($model, 'sertificate_name')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'sertificate_series')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'sertificate_num')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'sertificate_organ')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'sertificate_date')->textInput() ?>

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
                                <?= Html::a(Yii::t('yee', 'Cancel'), ['/student/default/index'], ['class' => 'btn btn-default']) ?>
                            <?php  else: ?>
                                <?= Html::submitButton(Yii::t('yee', 'Save'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Delete'),
                                    ['/student/default/delete', 'id' => $model->id], [
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
