<?php

use yeesoft\widgets\ActiveForm;
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
                'action' => $model->isNewRecord ?
                        ['/calendar/event/create-event'] :
                        ['/calendar/event/update-event?id=' . $model->id],
    ]);
    ?>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-body">

                    <?= $form->field($model, 'category_id') ?>

                    <?= $form->field($model, 'auditory_id') ?>

                    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

                    <?= $form->field($model, 'start_timestamp')->widget(kartik\datetime\DateTimePicker::classname())->widget(\yii\widgets\MaskedInput::className(),['mask' => Yii::$app->settings->get('reading.date_time_mask')])->textInput(); ?>
                    
                    <?= $form->field($model, 'end_timestamp')->widget(kartik\datetime\DateTimePicker::classname())->widget(\yii\widgets\MaskedInput::className(),['mask' => Yii::$app->settings->get('reading.date_time_mask')])->textInput() ?>
                  
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
