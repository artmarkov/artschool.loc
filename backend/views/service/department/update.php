<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\service\Department */

$this->title = 'Update Department: ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Departments', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="department-update">
    <h3 class="lte-hide-title"><?= Html::encode($this->title) ?></h3>
    <?= $this->render('_form', compact('model')) ?>
</div>