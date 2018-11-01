<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\user\UserCommon */

$this->title = 'Create Parent';
$this->params['breadcrumbs'][] = ['label' => 'Parents', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="parents-create">
    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>
    <?=  $this->render('_form_modal', compact('model')) ?>
</div>