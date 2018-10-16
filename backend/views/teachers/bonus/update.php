<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\teachers\Bonus */

$this->title = Yii::t('yee','Update'). ' : ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/teachers','Teachers'), 'url' => ['teachers/default/index']];
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/teachers','Bonus'), 'url' => ['index']];
$this->params['breadcrumbs'][] = Yii::t('yee','Update');
?>
<div class="bonus-update">
    <h3 class="lte-hide-title"><?= Html::encode($this->title) ?></h3>
    <?= $this->render('_form', compact('model')) ?>
</div>