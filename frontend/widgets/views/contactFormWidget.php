<?php
 
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\bootstrap\Modal;

$this->title = Yii::t('yee', 'Feedback');
$this->params['breadcrumbs'][] = $this->title;
 
Modal::begin([
    'header' => '<h3 class="lte-hide-title page-title">' . Html::encode($this->title) . '</h3>',
    'size' => 'modal-lg',
    'id' => 'contact-modal',
]);
?>

<div class="site-contact"> 

    <?php $form = ActiveForm::begin(['id' => 'contact-form']); ?>
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <p class="text-muted">
                        <?= Yii::t('yee', 'If you have questions, please fill out the following form to contact us. Thank you.'); ?>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <?= $form->field($model, 'name')->textInput(['autofocus' => true]) ?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <?= $form->field($model, 'email') ?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <?= $form->field($model, 'subject') ?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <?= $form->field($model, 'body')->textarea(['rows' => 6]) ?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <?= $this->render('@common/widgets/views/_captcha', ['model' => $model, 'form' => $form]) ?>

                    <hr>

                    <?= Html::submitButton(Yii::t('yee', 'Submit'), ['class' => 'btn btn-primary', 'name' => 'contact-button']) ?>

                    <?php ActiveForm::end(); ?>
                </div>
            </div>
        </div>
    </div>
</div>
 
<?php Modal::end(); ?>