<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\creative\CreativeWorksAuthor */

$this->title = 'Create Creative Works Author';
$this->params['breadcrumbs'][] = ['label' => 'Creative Works Authors', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="creative-works-author-create">
    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>
    <?=  $this->render('_form', compact('model')) ?>
</div>