<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\AuditoryBuilding */

$this->title = 'Create Auditory Building';
$this->params['breadcrumbs'][] = ['label' => 'Auditory Buildings', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="auditory-building-create">
    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>
    <?=  $this->render('_form', compact('model')) ?>
</div>