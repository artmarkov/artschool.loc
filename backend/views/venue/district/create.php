<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\venue\VenueDistrict */

$this->title = 'Create Venue District';
$this->params['breadcrumbs'][] = ['label' => 'Venue Districts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="venue-district-create">
    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>
    <?=  $this->render('_form', compact('model')) ?>
</div>