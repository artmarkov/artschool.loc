<?php

use yeesoft\widgets\ActiveForm;
use yeesoft\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\user\UserCommon */
/* @var $form yeesoft\widgets\ActiveForm */

?>

<div class="works-author-form">
    <?php if ($model->isNewRecord) {
        $action = 'create-author';
    } else {
        $action = 'update-author';
    }
    ?>
    <?php $form = ActiveForm::begin([
    'id' => 'works-author-form',
        
    'enableAjaxValidation' => true,
    'action' => ['creative/works-author/' . $action , 'id' => $model->id]
]);
    ?>

    <div class="row">
        <div class="col-md-12">
            <div class="form-group clearfix">
                <h4><?= $modelUser->fullName ?></h4>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'weight')->textInput() ?>
                </div>
                <div class="col-md-6">
                    <?php if ($model->timestamp_weight) $model->timestamp_weight = date("m-Y", (integer)$model->timestamp_weight); ?>
                    <?= $form->field($model, 'timestamp_weight')->widget(\kartik\date\DatePicker::classname(), [
                        'type' => \kartik\date\DatePicker::TYPE_INPUT,
                        'options' => ['placeholder' => ''],
                        'convertFormat' => true,
                        // 'value'=> date("m-Y",(integer) $model->timestamp_weight),
                        'pluginOptions' => [
                            'format' => 'MM-yyyy',
                            'minViewMode' => 1,
                            'maxViewMode' => 2,
                            'autoclose' => true,
                        ]
                    ]); ?>
                </div>
            </div>

            <?= $form->field($model, 'works_id')->label(false)->hiddenInput() ?>
            <?= $form->field($model, 'author_id')->label(false)->hiddenInput() ?>

            <?php if ($model->isNewRecord) {
                echo Html::submitButton(Yii::t('yee', 'Add'), ['class' => 'btn btn-primary']);
            } else {
                echo Html::submitButton(Yii::t('yee', 'Update'), ['class' => 'btn btn-primary']);
            }
            ?>

        </div>
    </div>

<?php ActiveForm::end(); ?>

</div>
