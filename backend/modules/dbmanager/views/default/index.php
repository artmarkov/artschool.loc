
<?php
use yeesoft\widgets\ActiveForm;
use yii\grid\GridView;
use bs\dbManager\models\BaseDumpManager;
use yii\bootstrap\Html;


/* @var $this yii\web\View */
/* @var $searchModel yeesoft\post\models\search\PostSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('dbManager', 'DB manager');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dbManager-default-index">

    <div class="row">
        <div class="col-sm-12">
            <h3 class="lte-hide-title page-title"><?= Html::encode($this->title) ?></h3>
            <?php $form = ActiveForm::begin([
                'action' => ['create'],
                'method' => 'post',
                'layout' => 'inline',
            ]) ?>

            <?= $form->field($model, 'db')->dropDownList(array_combine($dbList, $dbList)) ?>

            <?= $form->field($model, 'isArchive')->checkbox() ?>

            <?= $form->field($model, 'schemaOnly')->checkbox() ?>

            <?php if (!BaseDumpManager::isWindows()) {
                echo $form->field($model, 'runInBackground')->checkbox();
            } ?>

            <?php if ($model->hasPresets()): ?>
                <?= $form->field($model, 'preset')->dropDownList($model->getCustomOptions(), ['prompt' => '']) ?>
            <?php endif ?>

            <?= Html::submitButton(Yii::t('dbManager', 'Create dump'), ['class' => 'btn btn-sm btn-primary']) ?>

            <?= Html::a(Yii::t('dbManager', 'Delete all'),
                ['delete-all'],
                [
                    'class' => 'btn btn-sm btn-danger',
                    'data-method' => 'post',
                    'data-confirm' => Yii::t('dbManager', 'Are you sure?'),
                ]
            ) ?>
            <?php ActiveForm::end() ?>

            <?php if (!empty($activePids)): ?>
                <div class="well">
                    <h4><?= Yii::t('dbManager', 'Active processes:') ?></h4>
                    <?php foreach ($activePids as $pid => $cmd): ?>
                        <b><?= $pid ?></b>: <?= $cmd ?><br>
                    <?php endforeach ?>
                </div>
            <?php endif ?>

        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-body">


            <?= GridView::widget([
                'dataProvider' => $dataProvider,

                'columns' => [

                    ['class' => 'yii\grid\SerialColumn'],

                    [
                        'attribute' => 'type',
                        'label' => Yii::t('dbManager', 'Type'),
                    ],
                    [
                        'attribute' => 'name',
                        'label' => Yii::t('dbManager', 'Name'),
                    ],
                    [
                        'attribute' => 'size',
                        'label' => Yii::t('dbManager', 'Size'),
                    ],
                    [
                        'attribute' => 'create_at',
                        'label' => Yii::t('dbManager', 'Create time'),
                    ],

                    [
                        'class' => 'yii\grid\ActionColumn',
                        'template' => '{download} {restore} {storage} {delete}',
                        'buttons' => [
                            'download' => function ($url, $model) {
                                return Html::a('<span class="glyphicon glyphicon-download-alt"></span>',
                                    [
                                        'download',
                                        'id' => $model['id'],
                                    ],
                                    [
                                        'title' => Yii::t('dbManager', 'Download'),
                                        'class' => 'btn btn-sm btn-default',
                                    ]);
                            },
                            'restore' => function ($url, $model) {
                                return Html::a('<span class="glyphicon glyphicon-import"></span>',
                                    [
                                        'restore',
                                        'id' => $model['id'],
                                    ],
                                    [
                                        'title' => Yii::t('dbManager', 'Restore'),
                                        'class' => 'btn btn-sm btn-default',
                                    ]);
                            },
                            'storage' => function ($url, $model) {
                                if (Yii::$app->has('backupStorage')) {
                                    $exists = Yii::$app->backupStorage->has($model['name']);

                                    return Html::a('<span class="glyphicon glyphicon-cloud-upload"></span>',
                                        [
                                            'storage',
                                            'id' => $model['id'],
                                        ],
                                        [
                                            'title' => $exists ? Yii::t('dbManager', 'Delete from storage') : Yii::t('dbManager', 'Upload from storage'),
                                            'class' => $exists ? 'btn btn-sm btn-danger' : 'btn btn-sm btn-success',
                                        ]);
                                }
                            },
                            'delete' => function ($url, $model) {
                                return Html::a('<span class="glyphicon glyphicon-trash"></span>',
                                    [
                                        'delete',
                                        'id' => $model['id'],
                                    ],
                                    [
                                        'title' => Yii::t('dbManager', 'Delete'),
                                        'data-method' => 'post',
                                        'data-confirm' => Yii::t('dbManager', 'Are you sure?'),
                                        'class' => 'btn btn-sm btn-danger',
                                    ]);
                            },
                        ],
                    ],
                ],
            ]) ?>


        </div>
    </div>
</div>


