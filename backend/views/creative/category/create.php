<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\creative\CreativeCategory */

$this->title = Yii::t('yee','Create');
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/creative','Creative Works'), 'url' => ['creative/default/index']];
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/creative','Category'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="creative-category-create">
    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>
    <?=  $this->render('_form', compact('model')) ?>
</div>