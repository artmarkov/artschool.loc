<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\service\Catalog */

$this->title = Yii::t('yee/service', 'Update Catalog: ' . $model->name, [
    'nameAttribute' => '' . $model->name,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/service', 'Catalogs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('yee/service', 'Update');
?>
<div class="catalog-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
