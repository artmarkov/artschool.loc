<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\service\Department */

$this->title = Yii::t('yee','Update') . ' : ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/guide', 'Division'), 'url' => ['/service/division/index']];
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/guide', 'Department'), 'url' => ['index']];
$this->params['breadcrumbs'][] = Yii::t('yee','Update');
?>
<div class="department-update">
    <h3 class="lte-hide-title"><?= Html::encode($this->title) ?></h3>
    <?= $this->render('_form', compact('model')) ?>
</div>