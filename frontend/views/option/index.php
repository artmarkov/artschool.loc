<?php

use yii\helpers\Url;
use yii\widgets\Pjax;
use yeesoft\grid\GridView;
use yeesoft\grid\GridQuickLinks;
use common\models\Option;
use yeesoft\helpers\Html;
use yeesoft\grid\GridPageSize;


/* @var $this yii\web\View */
/* @var $searchModel common\models\OptionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Options';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="option-index">

    <div class="row">
        <div class="col-sm-12">
            <h3 class="lte-hide-title page-title"><?=  Html::encode($this->title) ?></h3>
            <?= Html::a(Yii::t('yee', 'Add New'), ['/option/create'], ['class' => 'btn btn-sm btn-primary']) ?>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-body">

            <div class="row">
                <div class="col-sm-6">
                    <?php 
                    /* Uncomment this to activate GridQuickLinks */
                    /* echo GridQuickLinks::widget([
                        'model' => Option::className(),
                        'searchModel' => $searchModel,
                    ])*/
                    ?>
                </div>

                <div class="col-sm-6 text-right">
                    <?=  GridPageSize::widget(['pjaxId' => 'option-grid-pjax']) ?>
                </div>
            </div>

            <?php 
            Pjax::begin([
                'id' => 'option-grid-pjax',
            ])
            ?>

            <?= 
            GridView::widget([
                'id' => 'option-grid',
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'bulkActionOptions' => [
                    'gridId' => 'option-grid',
                    'actions' => [Url::to(['bulk-delete']) => Yii::t('yee','Delete')] //Configure here you bulk actions
                ],
                'columns' => [
                    ['class' => 'yeesoft\grid\CheckboxColumn', 'options' => ['style' => 'width:10px']],
                    [
                        'class' => 'yeesoft\grid\columns\TitleActionColumn',
                        'controller' => '/option',
                        'title' => function(Option $model) {
                            return Html::a($model->id, ['view', 'id' => $model->id], ['data-pjax' => 0]);
                        },
                    ],

            'id',
            'name:ntext',

                ],
            ]);
            ?>

            <?php Pjax::end() ?>
        </div>
    </div>
</div>


