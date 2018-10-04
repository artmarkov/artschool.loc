<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Auditory */

$this->title = 'Update Auditory: ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Auditories', 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="auditory-update">
    <h3 class="lte-hide-title"><?= Html::encode($this->title) ?></h3>
    <?= $this->render('_form', compact('model')) ?>
</div>