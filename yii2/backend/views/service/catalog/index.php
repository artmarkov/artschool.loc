<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel common\models\service\CatalogSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('yee/service', 'Catalogs');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="catalog-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('yee/service', 'Create Catalog'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
           // 'tree',
            'lft',
            'rgt',
            'depth',
            //'url:url',
            //'text',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>
