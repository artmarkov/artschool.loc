<?php

use yii\widgets\DetailView;
use yeesoft\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Measure */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Measures', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="measure-view">

    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>

    <div class="panel panel-default">
        <div class="panel-body">

            <p>
                <?=                 Html::a('Edit', ['/measure/update', 'id' => $model->id],
                    ['class' => 'btn btn-sm btn-primary'])
                ?>
                <?=                 Html::a('Delete', ['/measure/delete', 'id' => $model->id],
                    [
                    'class' => 'btn btn-sm btn-default',
                    'data' => [
                        'confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                        'method' => 'post',
                    ],
                ])
                ?>
                <?=                 Html::a(Yii::t('yee', 'Add New'), ['/measure/create'],
                    ['class' => 'btn btn-sm btn-primary pull-right'])
                ?>
            </p>


            <?=             DetailView::widget([
                'model' => $model,
                'attributes' => [
            'id',
            'name',
            'abbr',
                ],
            ])
            ?>

        </div>
    </div>

</div>
