<?php

use yii\widgets\DetailView;
use yeesoft\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\venue\VenuePlace */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Venue Places', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="venue-place-view">

    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>

    <div class="panel panel-default">
        <div class="panel-body">

            <p>
                <?=                 Html::a('Edit', ['/venue/default/update', 'id' => $model->id],
                    ['class' => 'btn btn-sm btn-primary'])
                ?>
                <?=                 Html::a('Delete', ['/venue/default/delete', 'id' => $model->id],
                    [
                    'class' => 'btn btn-sm btn-default',
                    'data' => [
                        'confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                        'method' => 'post',
                    ],
                ])
                ?>
                <?=                 Html::a(Yii::t('yee', 'Add New'), ['/venue/default/create'],
                    ['class' => 'btn btn-sm btn-primary pull-right'])
                ?>
            </p>


            <?=             DetailView::widget([
                'model' => $model,
                'attributes' => [
            'id',
            'country_id',
            'sity_id',
            'district_id',
            'name',
            'address',
            'phone',
            'phone_optional',
            'email:email',
            'сontact_person',
            'latitude',
            'longitude',
            'description',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
                ],
            ])
            ?>

        </div>
    </div>

</div>
