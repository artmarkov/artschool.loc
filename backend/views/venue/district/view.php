<?php

use yii\widgets\DetailView;
use yeesoft\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\venue\VenueDistrict */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/guide','Districts'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="venue-district-view">

    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>

    <div class="panel panel-default">
        <div class="panel-body">

            <p>
                <?=                 Html::a('Edit', ['/venue-district/default/update', 'id' => $model->id],
                    ['class' => 'btn btn-sm btn-primary'])
                ?>
                <?=                 Html::a('Delete', ['/venue-district/default/delete', 'id' => $model->id],
                    [
                    'class' => 'btn btn-sm btn-default',
                    'data' => [
                        'confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                        'method' => 'post',
                    ],
                ])
                ?>
                <?=                 Html::a(Yii::t('yee', 'Add New'), ['/venue-district/default/create'],
                    ['class' => 'btn btn-sm btn-primary pull-right'])
                ?>
            </p>


            <?=             DetailView::widget([
                'model' => $model,
                'attributes' => [
            'id',
            'sity_id',
            'name',
            'slug',
                ],
            ])
            ?>

        </div>
    </div>

</div>
