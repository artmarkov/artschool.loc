<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\student\Student */

$this->title = Yii::t('yee','Update'). ' : ' . ' ' . $model->studentsFullName;
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/student','Students'), 'url' => ['index']];
$this->params['breadcrumbs'][] = Yii::t('yee','Update');
?>
<div class="student-update">
    <h3 class="lte-hide-title"><?= Html::encode($this->title) ?></h3>
    <?= $this->render('_form', ['model' => $model, 'modelUser' => $modelUser]) ?>
</div>