<?php

use yeesoft\widgets\ActiveForm;
use common\models\user\User;
use yeesoft\helpers\Html;
use yii\widgets\MaskedInput;

/* @var $this yii\web\View */
/* @var $model common\models\user\UserCommon */
/* @var $form yeesoft\widgets\ActiveForm */

?>

<div class="parents-form">

    <?php $form = ActiveForm::begin([
    'id' => 'works-author-form',
        
    'enableAjaxValidation' => true,
    'action' => ['creative/works-author/create-author']
]);
    ?>
    <div class="row">
        <div class="col-md-12">
           
        

            <?= Html::submitButton(Yii::t('yee', 'Create'), ['class' => 'btn btn-primary']) ?>
        </div>
    </div>


<?php ActiveForm::end(); ?>

</div>
