<?php

use backend\modules\eav\models\EavAttributeType;
use yeesoft\grid\GridPageSize;
use yeesoft\grid\GridView;
use yeesoft\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel app\models\EavAttributeTypeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('yee/eav', 'Attribute Types');
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/eav', 'EAV'), 'url' => ['/eav/default/index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="eav-attribute-type-index">

    <div class="row">
        <div class="col-sm-12">
            <h3 class="lte-hide-title page-title"><?= Html::encode($this->title) ?></h3>
            <?= Html::a(Yii::t('yee', 'Add New'), ['/eav/attribute-type/create'], ['class' => 'btn btn-sm btn-primary']) ?>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-body">

            <div class="row">
                <div class="col-sm-6">
                    <?php
                    /* Uncomment this to activate GridQuickLinks */
                    /* echo GridQuickLinks::widget([
                        'model' => EavAttributeType::className(),
                        'searchModel' => $searchModel,
                    ])*/
                    ?>
                </div>

                <div class="col-sm-6 text-right">
                    <?= GridPageSize::widget(['pjaxId' => 'eav-attribute-type-grid-pjax']) ?>
                </div>
            </div>

            <?php
            Pjax::begin([
                'id' => 'eav-attribute-type-grid-pjax',
            ])
            ?>

            <?=
            GridView::widget([
                'id' => 'eav-attribute-type-grid',
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'bulkActionOptions' => [
                    'gridId' => 'eav-attribute-type-grid',
                    'actions' => [Url::to(['bulk-delete']) => Yii::t('yee', 'Delete')] //Configure here you bulk actions
                ],
                'columns' => [
                    ['class' => 'yeesoft\grid\CheckboxColumn', 'options' => ['style' => 'width:10px']],
                    ['attribute' => 'id', 'options' => ['style' => 'width:20px']],
                    [
                        'class' => 'yeesoft\grid\columns\TitleActionColumn',
                        'attribute' => 'name',
                        'controller' => '/eav/attribute-type',
                        'buttonsTemplate' => '{update} {delete}',
                        'title' => function (EavAttributeType $model) {
                            return Html::a($model->name, ['update', 'id' => $model->id], ['data-pjax' => 0]);
                        },
                    ],
                    [
                        'attribute' => 'store_type',
                        'value' => function (EavAttributeType $model) {
                            $types = EavAttributeType::getStoreTypes();
                            return isset($types[$model->store_type]) ? $types[$model->store_type] : Yii::t('yii', '(not set)');
                        },
                        'filter' => ArrayHelper::merge(['' => Yii::t('yee', 'Not Selected')], EavAttributeType::getStoreTypes()),
                    ],
                ],
            ]);
            ?>

            <?php Pjax::end() ?>
        </div>
    </div>
</div>


