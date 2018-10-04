<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\venue\VenueCountry */

$this->title = 'Create Venue Country';
$this->params['breadcrumbs'][] = ['label' => 'Venue Countries', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="venue-country-create">
    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>
    <?=  $this->render('_form', compact('model')) ?>
</div>