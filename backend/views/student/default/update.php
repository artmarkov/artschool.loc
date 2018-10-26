<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\student\Student */

$this->title = Yii::t('yee','Update'). ' : ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/students','Students'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('yee','Update');
?>
<div class="student-update">
    <h3 class="lte-hide-title"><?= Html::encode($this->title) ?></h3>
    <?= $this->render('_form', compact('model')) ?>
</div>