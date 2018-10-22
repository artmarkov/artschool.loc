<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\service\Division */

$this->title = 'Update Division: ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Divisions', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="division-update">
    <h3 class="lte-hide-title"><?= Html::encode($this->title) ?></h3>
    <?= $this->render('_form', compact('model')) ?>
</div>