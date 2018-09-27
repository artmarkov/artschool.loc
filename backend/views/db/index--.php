<?php

use yii\helpers\Html;
//use yii\grid\GridView;
use yeesoft\grid\GridView;
$this->title = 'База данных';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="post-index">


    <div class="row">
        <div class="col-sm-12">
            <h3 class="lte-hide-title page-title"><?= Html::encode($this->title) ?></h3>
            <?= Html::a(Yii::t('yee', 'Создать дамп БД'), ['export'], ['class' => 'btn btn-sm btn-primary']) ?>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-body">

            <div class="row">
                <div class="col-sm-12">
                    <?= GridView::widget([
                        'id' => 'db-grid',
                        'dataProvider' => $dataProvider,
                        'bulkActionOptions' => [
                            'gridId' => 'db-grid',
                           // 'actions' => [ Url::to(['bulk-delete']) => 'Delete'] //Configure here you bulk actions
                        ],
                        'columns' => [
                            [
                                'attribute' => 'dump',
                                'label' => 'Путь к дампу БД',
                                'format' => 'text',
                                'options' => ['style' => 'width:600px'],
                                'class' => 'yeesoft\grid\columns\TitleActionColumn',
                                'controller' => '\backend\controllers\DbController',
                                'title' => function ($data) {
                                    return $data['dump'];
                                },

                            'buttonsTemplate' => '{download} {import} {delete}',
                                'buttons' => [
                                    'download' => function ($data, $id) {
                                        return Html::a(Yii::t('yee', 'Download'),
                                            \yii\helpers\Url::to(['db/download', 'path' => $data['dump']]),
                                            [
                                                'title' => Yii::t('yee', 'Download'),
                                                'data-pjax' => '0'
                                            ]
                                        );
                                    },
                                    'import' => function ($data, $id) {
                                        return Html::a(Yii::t('yee', 'Import'),
                                            \yii\helpers\Url::to(['db/import', 'path' => $data['dump']]), [
                                                'title' => Yii::t('yee', 'Import'),
                                                'data-confirm' => Yii::t('yee', 'Are you sure?'),
                                                'data-pjax' => '0',
                                                'format' => 'raw',
                                            ]
                                        );
                                    },
                                    'delete' => function ($data, $id) {
                                        return Html::a(Yii::t('yee', 'Delete'),
                                            \yii\helpers\Url::to(['db/delete', 'path' => $data['dump']]), [
                                                'title' => Yii::t('yee', 'Delete'),
                                                'data-confirm' => Yii::t('yee', 'Are you sure?'),
                                                'data-pjax' => '0'
                                            ]
                                        );
                                    },
                                ],

                                ],
                            [
                                'attribute' => 'size',
                                'format' => 'text',
                                'label' => 'Размер',
                            ],
                            [
                                'attribute' => 'create_at',
                                'format' => 'text',
                                'label' => 'Создан',
                            ],
                            [
                                'format' => 'raw',
                                'value' => function ($data, $id) {
                                    return Html::a('Импортировать в БД', \yii\helpers\Url::to(['db/import', 'path' => $data['dump']]), ['title' => 'Импортировать', 'class' => 'btn btn-sm btn-primary','data-confirm' => Yii::t('yee', 'Are you sure?')]);
                                }
                            ],
                            [
                                'format' => 'raw',
                                //кнопку удаления выводим только если >1 дампа БД
                                'value' => function ($data, $id) {
                                    if (Yii::$app->params['count_db'] > 1) {
                                        return Html::a('Удалить', \yii\helpers\Url::to(['db/delete', 'path' => $data['dump']]), ['title' => 'Удалить', 'class' => 'btn btn-sm btn-danger','data-confirm' => Yii::t('yee', 'Are you sure?')]);
                                    } else return false;
                                }
                            ],
                            [
                                'format' => 'raw',
                                'value' => function ($data, $id) {
                                        return Html::a('Скачать', \yii\helpers\Url::to(['db/download', 'path' => $data['dump']]), ['title' => 'Скачать', 'class' => 'btn btn-sm btn-primary']);
                                }
                            ],
                        ],
                    ]); ?>

                </div>
            </div>
        </div>
    </div>
</div>
