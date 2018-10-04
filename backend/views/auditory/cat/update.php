<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\AuditoryCat */

$this->title = 'Update Auditory Cat: ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Auditories', 'url' => ['auditory/default/index']];
$this->params['breadcrumbs'][] = ['label' => 'Auditory Cats', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['update', 'id' => $model->id]];
?>
<div class="auditory-cat-update">
    <h3 class="lte-hide-title"><?= Html::encode($this->title) ?></h3>
    <?= $this->render('_form', compact('model')) ?>
</div>