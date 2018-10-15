<?php

use yii\helpers\Url;
use yii\widgets\Pjax;
use yeesoft\grid\GridView;
use yeesoft\grid\GridQuickLinks;
use common\models\venue\VenuePlace;
use yeesoft\helpers\Html;
use yeesoft\grid\GridPageSize;

/* @var $this yii\web\View */
/* @var $searchModel common\models\venue\search\VenuePlaceSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('yee/guide', 'Venue Place');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="venue-place-index">

    <div class="row">
        <div class="col-sm-12">
            <h3 class="lte-hide-title page-title"><?= Html::encode($this->title) ?></h3>
            <?= Html::a(Yii::t('yee', 'Add New'), ['/venue/create'], ['class' => 'btn btn-sm btn-primary']) ?>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-body">

            <div class="row">
                <div class="col-sm-6">
                    <?php
                    /* Uncomment this to activate GridQuickLinks */
                    /* echo GridQuickLinks::widget([
                        'model' => VenuePlace::className(),
                        'searchModel' => $searchModel,
                    ])*/
                    ?>
                </div>

                <div class="col-sm-6 text-right">
                    <?= GridPageSize::widget(['pjaxId' => 'venue-place-grid-pjax']) ?>
                </div>
            </div>

            <?php
            Pjax::begin([
                'id' => 'venue-place-grid-pjax',
            ])
            ?>

            <?=
            GridView::widget([
                'id' => 'venue-place-grid',
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'bulkActionOptions' => [
                    'gridId' => 'venue-place-grid',
                    'actions' => [Url::to(['bulk-delete']) => 'Delete'] //Configure here you bulk actions
                ],
                'columns' => [
                    ['class' => 'yeesoft\grid\CheckboxColumn', 'options' => ['style' => 'width:10px']],
                    ['class' => 'yii\grid\SerialColumn', 'options' => ['style' => 'width:20px']],
                    [
                        'class' => 'yeesoft\grid\columns\TitleActionColumn',
                        'options' => ['style' => 'width:300px'],
                        'attribute' => 'name',
                        'controller' => '/venue/default',
                        'title' => function (VenuePlace $model) {
                            return Html::a($model->name, ['update', 'id' => $model->id], ['data-pjax' => 0]);
                        },
                        'buttonsTemplate' => '{update} {delete}',
                    ],

                    // 'id',
                    // 'sity_id',
                    // 'district_id',
                    // 'name',
                    // 'countryName',
                    [
                        'attribute' => 'country_id',
                        'value' => 'countryName',
                        'label' => Yii::t('yee/guide', 'Name Country'),
                        'filter' => common\models\venue\VenueCountry::getVenueCountryList(),
                    ],
                    [
                        'attribute' => 'sityName',
                        'label' => Yii::t('yee/guide', 'Name Sity'),
                    ],
                    [
                        'attribute' => 'districtSlug',
                        'label' => Yii::t('yee/guide', 'Name District Slug'),
                    ],

                    'address',
                    'phone',
                    // 'phone_optional',
                    // 'email:email',
                    // 'сontact_person',
//                    'latitude',
//                    'longitude',
                    // 'description',
                    // 'created_at',
                    // 'updated_at',
                    // 'created_by',
                    // 'updated_by',

                ],
            ]);
            ?>

            <?php Pjax::end() ?>
        </div>
    </div>
</div>


