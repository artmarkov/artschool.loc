<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\AuditoryBuilding */

$this->title = 'Update Auditory Building: ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Auditories', 'url' => ['auditory/default/index']];
$this->params['breadcrumbs'][] = ['label' => 'Auditory Buildings', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['update', 'id' => $model->id]];
?>
<div class="auditory-building-update">
    <h3 class="lte-hide-title"><?= Html::encode($this->title) ?></h3>
    <?= $this->render('_form', compact('model')) ?>
</div>