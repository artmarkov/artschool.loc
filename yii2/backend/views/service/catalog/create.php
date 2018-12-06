<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\service\Catalog */

$this->title = Yii::t('yee/service', 'Create Catalog');
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/service', 'Catalogs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="catalog-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model, 
    ]) ?>

</div>
