<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\user\UserCommon */

$this->title = 'Update: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Parents', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="parents-update">
    <h3 class="lte-hide-title"><?= Html::encode($this->title) ?></h3>
    <?= $this->render('_form', compact('model')) ?>
</div>