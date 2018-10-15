<?php

use yii\helpers\Url;
use yii\widgets\Pjax;
use yeesoft\grid\GridView;
use yeesoft\grid\GridQuickLinks;
use common\models\auditory\AuditoryBuilding;
use yeesoft\helpers\Html;
use yeesoft\grid\GridPageSize;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('yee/guide','Building');
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/guide','Auditory'), 'url' => ['auditory/default/index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="auditory-building-index">

    <div class="row">
        <div class="col-sm-12">
            <h3 class="lte-hide-title page-title"><?=  Html::encode($this->title) ?></h3>
            <?= Html::a(Yii::t('yee', 'Add New'), ['/auditory/building/create'], ['class' => 'btn btn-sm btn-primary']) ?>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-body">

            <div class="row">
                <div class="col-sm-6">
                    <?php 
                    /* Uncomment this to activate GridQuickLinks */
                    /* echo GridQuickLinks::widget([
                        'model' => AuditoryBuilding::className(),
                        'searchModel' => $searchModel,
                    ])*/
                    ?>
                </div>

               <!-- <div class="col-sm-6 text-right">
                    <?/*=  GridPageSize::widget(['pjaxId' => 'auditory-building-grid-pjax']) */?>
                </div>-->
            </div>

            <?php 
            Pjax::begin([
                'id' => 'auditory-building-grid-pjax',
            ])
            ?>

            <?= 
            GridView::widget([
                'id' => 'auditory-building-grid',
                'dataProvider' => $dataProvider,
                                'bulkActionOptions' => [
                    'gridId' => 'auditory-building-grid',
                    'actions' => [ Url::to(['bulk-delete']) => 'Delete'] //Configure here you bulk actions
                ],
                'columns' => [
                    ['class' => 'yeesoft\grid\CheckboxColumn', 'options' => ['style' => 'width:10px']],
                    ['class' => 'yii\grid\SerialColumn', 'options' => ['style' => 'width:20px'],],
                    [
                        'class' => 'yeesoft\grid\columns\TitleActionColumn',
                        'options' => ['style' => 'width:300px'],
                        'attribute' => 'name',
                        
                        'controller' => '/auditory/building',
                        'title' => function(AuditoryBuilding $model) {
                            return Html::a($model->name, ['update', 'id' => $model->id], ['data-pjax' => 0]);
                        },
                        'buttonsTemplate' => '{update} {delete}',
                    ],

            //'id',
            //'name',
            'slug',
            'address',

                ],
            ]);
            ?>

            <?php Pjax::end() ?>
        </div>
    </div>
</div>


