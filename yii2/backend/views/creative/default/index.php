<?php

use yii\helpers\Url;
use yii\widgets\Pjax;
use yeesoft\grid\GridView;
use yeesoft\grid\GridQuickLinks;
use common\models\creative\CreativeWorks;
use common\models\user\UserCommon;
use yeesoft\helpers\Html;
use yeesoft\grid\GridPageSize;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $searchModel common\models\creative\search\CreativeWorksSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('yee/creative','Creative Works');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="creative-works-index">

    <div class="row">
        <div class="col-sm-12">
            <h3 class="lte-hide-title page-title"><?=  Html::encode($this->title) ?></h3>
            <?= Html::a(Yii::t('yee', 'Add New'), ['/creative/default/create'], ['class' => 'btn btn-sm btn-primary']) ?>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-body">

            <div class="row">
                <div class="col-sm-6">
                    <?= GridQuickLinks::widget([
                        'model' => CreativeWorks::className(),
                        'searchModel' => $searchModel,
                        'labels' => [
                            'all' => Yii::t('yee', 'All'),
                            'active' => Yii::t('yee', 'Published'),
                            'inactive' => Yii::t('yee', 'Pending'),
                        ]
                    ]) ?>
                </div>

                <div class="col-sm-6 text-right">
                    <?=  GridPageSize::widget(['pjaxId' => 'creative-works-grid-pjax']) ?>
                </div>
            </div>

            <?php 
            Pjax::begin([
                'id' => 'creative-works-grid-pjax',
            ])
            ?>

            <?= 
            GridView::widget([
                'id' => 'creative-works-grid',
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'bulkActionOptions' => [
                    'gridId' => 'post-grid',
                    'actions' => [
                        Url::to(['bulk-activate']) => Yii::t('yee', 'Publish'),
                        Url::to(['bulk-deactivate']) => Yii::t('yee', 'Unpublish'),
                        Url::to(['bulk-delete']) => Yii::t('yii', 'Delete'),
                    ]
                ],
                'columns' => [
                    ['class' => 'yeesoft\grid\CheckboxColumn', 'options' => ['style' => 'width:10px']],
                    ['class' => 'yii\grid\SerialColumn', 'options' => ['style' => 'width:20px'],],
                    [
                        'class' => 'yeesoft\grid\columns\TitleActionColumn',
                        'options' => ['style' => 'width:800px'],
                        'attribute' => 'name',
                        'controller' => '/creative/default',
                        'title' => function(CreativeWorks $model) {
                            return Html::a($model->name, ['update', 'id' => $model->id], ['data-pjax' => 0]);
                        },
                                'buttonsTemplate' => '{update} {delete}',
                    ],
                    [
                        'attribute' => 'category_id',
                        'value' => 'categoryName',
                        'label' => Yii::t('yee/creative', 'Creative Category'),
                        'filter' => \common\models\creative\CreativeCategory::getCreativeCategoryList(),
                    ],
                    [
                        'attribute' => 'gridDepartmentSearch',
                        'filter' => CreativeWorks::getDepartmentList(),
                        'value' => function (CreativeWorks $model) {
                            return implode(', ',
                                ArrayHelper::map($model->departmentItem, 'id', 'name'));
                        },
                        'options' => ['style' => 'width:350px'],
                        'format' => 'raw',
                    ],
                    [
                        'attribute' => 'gridAuthorSearch',
                        'filter' => UserCommon::getWorkAuthorTeachersList(),
                        'value' => function (CreativeWorks $model) {
                            return implode('<br />',
                                ArrayHelper::map($model->authorItem, 'id', 'lastFM'));
                        },
                        'options' => ['style' => 'width:350px'],
                        'format' => 'raw',
                    ],   
                    [
                        'class' => 'yeesoft\grid\columns\StatusColumn',
                        'attribute' => 'status',
                        'optionsArray' => CreativeWorks::getStatusOptionsList(),
                        'options' => ['style' => 'width:180px'],
                    ],
                    [
                        'class' => 'common\components\grid\columns\DateFilterColumn',
                        'attribute' => 'published_at',
                        'value' => function (CreativeWorks $model) {
                            return '<span style="font-size:85%;" class="label label-'
                            . ((time() >= $model->published_at) ? 'primary' : 'default') . '">'
                            . $model->publishedDate . '</span>';
                        },
                        'format' => 'raw',
                        'options' => ['style' => 'width:150px'],
                    ],
                ],
            ]);
            ?>

            <?php Pjax::end() ?>
        </div>
    </div>
</div>


