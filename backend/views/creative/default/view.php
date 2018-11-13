<?php

use yii\widgets\DetailView;
use yeesoft\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\creative\CreativeWorks */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/creative','Creative Works'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="creative-works-view">

    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>

    <div class="panel panel-default">
        <div class="panel-body">

            <p>
                <?=                 Html::a('Edit', ['/creative/default/update', 'id' => $model->id],
                    ['class' => 'btn btn-sm btn-primary'])
                ?>
                <?=                 Html::a('Delete', ['/creative/default/delete', 'id' => $model->id],
                    [
                    'class' => 'btn btn-sm btn-default',
                    'data' => [
                        'confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                        'method' => 'post',
                    ],
                ])
                ?>
                <?=                 Html::a(Yii::t('yee', 'Add New'), ['/creative/default/create'],
                    ['class' => 'btn btn-sm btn-primary pull-right'])
                ?>
            </p>


            <?= DetailView::widget([
                'model' => $model,
                'attributes' => [
            'id',
            'category_id',
            'name',
            'description:ntext',
            'status',
            'comment_status',
            'published_at',
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
