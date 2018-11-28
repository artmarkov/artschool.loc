<?php

use yeesoft\widgets\ActiveForm;
use common\models\calendar\Event;
use yeesoft\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\calendar\Event */
/* @var $form yeesoft\widgets\ActiveForm */
?>

<div class="event-form">


    <?php
    $form = ActiveForm::begin([
                'id' => 'event-form',
                'enableAjaxValidation' => true,
    ]);
    ?>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-body">

                    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

                    <?php  if($model->start_timestamp) $model->start_timestamp = date("d-m-Y  H:i", (integer) mktime(0,0,0, date("m", $model->start_timestamp), date("d", $model->start_timestamp), date("Y", $model->start_timestamp)));  ?>
                    <?= $form->field($model, 'start_timestamp')->widget(\kartik\date\DatePicker::classname()); ?>
                    
                    <?php  if($model->end_timestamp) { $model->end_timestamp = date("d-m-Y H:i", (integer) mktime( date("H", $model->end_timestamp), date("i", $model->end_timestamp),0, date("m", $model->end_timestamp), date("d", $model->end_timestamp), date("Y", $model->end_timestamp))); } ?>
                    <?= $form->field($model, 'end_timestamp')->widget(\yii\widgets\MaskedInput::className(),['mask' => Yii::$app->settings->get('reading.date_time_mask')])->textInput() ?>
                
                </div>

            </div>
            <div class="form-group">
                <?php if ($model->isNewRecord): ?>
                    <?= Html::submitButton(Yii::t('yee', 'Create'), ['class' => 'btn btn-primary']) ?>
                    <?= Html::a(Yii::t('yee', 'Cancel'), ['/calendar/event/index'], ['class' => 'btn btn-default']) ?>
                <?php else: ?>
                    <?= Html::submitButton(Yii::t('yee', 'Save'), ['class' => 'btn btn-primary']) ?>
                    <?=
                    Html::a(Yii::t('yee', 'Delete'), ['/calendar/event/delete', 'id' => $model->id], [
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

    <?php ActiveForm::end(); ?>

</div>
