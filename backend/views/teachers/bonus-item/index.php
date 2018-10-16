<?php

use yii\helpers\Url;
use yii\widgets\Pjax;
use yeesoft\grid\GridView;
use yeesoft\grid\GridQuickLinks;
use common\models\teachers\BonusItem;
use yeesoft\helpers\Html;
use yeesoft\grid\GridPageSize;

/* @var $this yii\web\View */
/* @var $searchModel common\models\teachers\search\BonusItemSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('yee/teachers', 'Bonus Item');
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/teachers', 'Teachers'), 'url' => ['teachers/default/index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bonus-item-index">

    <div class="row">
        <div class="col-sm-12">
            <h3 class="lte-hide-title page-title"><?= Html::encode($this->title) ?></h3>
<?= Html::a(Yii::t('yee', 'Add New'), ['/teachers/bonus-item/create'], ['class' => 'btn btn-sm btn-primary']) ?>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-body">

            <div class="row">
                <div class="col-sm-6">
                    <?php
                    /* Uncomment this to activate GridQuickLinks */
                    echo GridQuickLinks::widget([
                        'model' => BonusItem::className(),
                        'searchModel' => $searchModel,
                    ])
                    ?>
                </div>

                <div class="col-sm-6 text-right">
<?= GridPageSize::widget(['pjaxId' => 'bonus-item-grid-pjax']) ?>
                </div>
            </div>

            <?php
            Pjax::begin([
                'id' => 'bonus-item-grid-pjax',
            ])
            ?>

            <?=
            GridView::widget([
                'id' => 'bonus-item-grid',
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'bulkActionOptions' => [
                    'gridId' => 'bonus-item-grid',
                //'actions' => [ Url::to(['bulk-delete']) => 'Delete'] //Configure here you bulk actions
                ],
                'columns' => [
                    ['class' => 'yeesoft\grid\CheckboxColumn', 'options' => ['style' => 'width:10px']],
                    [
                        'class' => 'yeesoft\grid\columns\TitleActionColumn',
                        'options' => ['style' => 'width:300px'],
                        'attribute' => 'name',
                        'controller' => '/teachers/bonus-item',
                        'title' => function (BonusItem $model) {
                    return Html::a($model->name, ['update', 'id' => $model->id], ['data-pjax' => 0]);
                },
                        'buttonsTemplate' => '{update} {delete}',
                    ],
                    'slug',
                    [
                        'attribute' => 'bonus_category_id',
                        'value' => 'bonusCategoryName',
                        'label' => Yii::t('yee/teachers', 'Name Bonus Category'),
                        'filter' => common\models\teachers\BonusCategory::getBonusCategoryList(),
                    ],
                    [
                        'attribute' => 'measureValueSlugName',
                        'label' => Yii::t('yee/teachers', 'Value Default'),
                    ],
                    'bonus_rule_id',
                    [
                        'class' => 'yeesoft\grid\columns\StatusColumn',
                        'attribute' => 'status',
                        'optionsArray' => [
                            [BonusItem::STATUS_ACTIVE, Yii::t('yee', 'Active'), 'primary'],
                            [BonusItem::STATUS_INACTIVE, Yii::t('yee', 'Inactive'), 'info'],
                        ],
                        'options' => ['style' => 'width:60px']
                    ],
                ],
            ]);
            ?>

            <?php Pjax::end() ?>
        </div>
    </div>
</div>


