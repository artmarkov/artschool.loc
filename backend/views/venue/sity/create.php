<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\venue\VenueSity */

$this->title = 'Create Venue Sity';
$this->params['breadcrumbs'][] = ['label' => 'Venue Sities', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="venue-sity-create">
    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>
    <?=  $this->render('_form', compact('model')) ?>
</div>