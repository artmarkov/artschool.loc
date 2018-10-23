<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\service\measure-unit */

$this->title = Yii::t('yee','Update'). ' : ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/guide','Measure Unit'), 'url' => ['index']];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="measure-unit-update">
    <h3 class="lte-hide-title"><?= Html::encode($this->title) ?></h3>
    <?= $this->render('_form', compact('model')) ?>
</div>