<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\service\Department */

$this->title = Yii::t('yee','Create');
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/guide', 'Division'), 'url' => ['/service/division/index']];
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/guide','Department'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="department-create">
    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>
    <?=  $this->render('_form', compact('model')) ?>
</div>