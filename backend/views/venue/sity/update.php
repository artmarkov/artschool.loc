<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\venue\VenueSity */

$this->title = Yii::t('yee/guide','Update Sity') .': ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Sities', 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] =  Yii::t('yii','Update');
?>
<div class="venue-sity-update">
    <h3 class="lte-hide-title"><?= Html::encode($this->title) ?></h3>
    <?= $this->render('_form', compact('model')) ?>
</div>