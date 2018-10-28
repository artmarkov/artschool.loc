<?php

use yii\helpers\Url;
use yii\widgets\Pjax;
use yeesoft\grid\GridView;
use yeesoft\grid\GridQuickLinks;
use common\models\subject\SubjectType;
use yeesoft\helpers\Html;
use yeesoft\grid\GridPageSize;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('yee/guide','Subject Type');
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/guide','Subjects'), 'url' => ['subject/default/index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="subject-type-index">

    <div class="row">
        <div class="col-sm-12">
            <h3 class="lte-hide-title page-title"><?=  Html::encode($this->title) ?></h3>
            <?= Html::a(Yii::t('yee', 'Add New'), ['/subject/type/create'], ['class' => 'btn btn-sm btn-primary']) ?>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-body">

            <div class="row">
                <div class="col-sm-6">
                    <?php 
                    /* Uncomment this to activate GridQuickLinks */
                    /* echo GridQuickLinks::widget([
                        'model' => SubjectType::className(),
                        'searchModel' => $searchModel,
                    ])*/
                    ?>
                </div>

                <div class="col-sm-6 text-right">
                    <?//=  GridPageSize::widget(['pjaxId' => 'subject-type-grid-pjax']) ?>
                </div>
            </div>

            <?php 
            Pjax::begin([
                'id' => 'subject-type-grid-pjax',
            ])
            ?>

            <?= 
            GridView::widget([
                'id' => 'subject-type-grid',
                'dataProvider' => $dataProvider,
                                'bulkActionOptions' => [
                    'gridId' => 'subject-type-grid',
//                    'actions' => [Url::to(['bulk-delete']) => Yii::t('yee','Delete')] //Configure here you bulk actions
                ],
                'columns' => [
                    ['class' => 'yeesoft\grid\CheckboxColumn', 'options' => ['style' => 'width:10px']],
                    [
                        'class' => 'yeesoft\grid\columns\TitleActionColumn',
                        'options' => ['style' => 'width:300px'],
                        'attribute' => 'name',
                        'controller' => '/subject/type',
                        'title' => function(SubjectType $model) {
                            return Html::a($model->name, ['update', 'id' => $model->id], ['data-pjax' => 0]);
                        },
                        'buttonsTemplate' => '{update} {delete}',
                    ],

            'slug',
                    [
                        'class' => 'yeesoft\grid\columns\StatusColumn',
                        'attribute' => 'status',
                        'optionsArray' => [
                            [SubjectType::STATUS_ACTIVE, Yii::t('yee', 'Active'), 'primary'],
                            [SubjectType::STATUS_INACTIVE, Yii::t('yee', 'Inactive'), 'info'],
                        ],
                        'options' => ['style' => 'width:150px']
                    ],

                ],
            ]);
            ?>

            <?php Pjax::end() ?>
        </div>
    </div>
</div>


