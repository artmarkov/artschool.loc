<?php
/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\ContactForm */

use yeesoft\helpers\Html;
use common\widgets\ActiveForm;

//use yii\captcha\Captcha;

$this->title = \Yii::t('app', 'Feedback');
$this->params['breadcrumbs'][] = $this->title;
?>
<!--<div class="site-contact">-->
<div class="contact-index">
    <div class="row">
        <div class="col-md-9">
            <span class="h4"><?= Html::encode($this->title) ?></span>
        </div>
    </div>
    <div class="row">
        <div class="col-md-9">
            <?php $form = ActiveForm::begin(['id' => 'contact-form']); ?>
            <div class="panel panel-default">
                <div class="panel-body">

                    <div class="row">

                        <p class="text-muted">
                            <?= \Yii::t('app', 'If you have questions, please fill out the following form to contact us. Thank you.'); ?>
                        </p>

                        <?= $form->field($model, 'name')->textInput(['autofocus' => true]) ?>

                        <?= $form->field($model, 'email') ?>

                        <?= $form->field($model, 'subject') ?>

                        <?= $form->field($model, 'body')->textarea(['rows' => 6]) ?>

                        <? /*= $form->field($model, 'verifyCode')->widget(Captcha::className(), [
                        'template' => '<div class="row"><div class="col-lg-3">{image}</div><div class="col-lg-6">{input}</div></div>',
                        ]) */ ?>
                        <?= $this->render('@common/widgets/views/_captcha', ['model' => $model, 'form' => $form]) ?>

                        <hr>

                        <?= Html::submitButton(\Yii::t('app', 'Submit'), ['class' => 'btn btn-primary', 'name' => 'contact-button']) ?>

                        <?php ActiveForm::end(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
