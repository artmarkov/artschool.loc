<?php

use yii\widgets\DetailView;
use yeesoft\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Option */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Options', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="option-view">

    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>

    <div class="panel panel-default">
        <div class="panel-body">

            <p>
                <?=                 Html::a('Edit', ['/option/update', 'id' => $model->id],
                    ['class' => 'btn btn-sm btn-primary'])
                ?>
                <?=                 Html::a('Delete', ['/option/delete', 'id' => $model->id],
                    [
                    'class' => 'btn btn-sm btn-default',
                    'data' => [
                        'confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                        'method' => 'post',
                    ],
                ])
                ?>
                <?=                 Html::a(Yii::t('yee', 'Add New'), ['/option/create'],
                    ['class' => 'btn btn-sm btn-primary pull-right'])
                ?>
            </p>


            <?=             DetailView::widget([
                'model' => $model,
                'attributes' => [
            'id',
            'name:ntext',
                ],
            ])
            ?>

        </div>
    </div>

</div>
