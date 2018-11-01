<?php

use yeesoft\widgets\ActiveForm;
use common\models\user\User;
use yeesoft\helpers\Html;
use yii\widgets\MaskedInput;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $model common\models\user\UserCommon */
/* @var $form yeesoft\widgets\ActiveForm */

$this->title = Yii::t('yee/user', 'Create Parent');

Modal::begin([
    'header' => '<h3 class="lte-hide-title page-title">' . Html::encode($this->title) . '</h3>',
    'size' => 'modal-lg',
    'id' => 'parent-modal',
]);
?>

<div class="parents-form">

    <?php $form = ActiveForm::begin([
    'id' => 'parent-form',
    'enableAjaxValidation' => true,
    'action' => ['parent/default/ajax-create']
]);
    ?>
    <div class="row">
        <div class="col-md-12">
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
                            <?= $form->field($model, 'gender')->dropDownList(User::getGenderList()) ?>
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

                <div class="panel-body">
                    <div class="form-group">
                        <?php if ($model->isNewRecord): ?>
                            <?= Html::submitButton(Yii::t('yee', 'Create'), ['class' => 'btn btn-primary']) ?>
                            <?= Html::a(Yii::t('yee', 'Cancel'), ['/student/default/index'], ['class' => 'btn btn-default']) ?>

                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>


<?php ActiveForm::end(); ?>

</div>
<?php Modal::end(); ?>