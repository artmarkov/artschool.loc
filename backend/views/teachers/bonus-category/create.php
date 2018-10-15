<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\teachers\BonusCategory */

$this->title = 'Create Bonus Category';
$this->params['breadcrumbs'][] = ['label' => 'Bonus Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="bonus-category-create">
    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>
    <?=  $this->render('_form', compact('model')) ?>
</div>