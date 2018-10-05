<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\venue\VenueDistrict */

$this->title = 'Update Venue District: ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Venue Districts', 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="venue-district-update">
    <h3 class="lte-hide-title"><?= Html::encode($this->title) ?>
        <?=                 Html::a(Yii::t('yee', 'Add New'), ['/venue/district/create'],
            ['class' => 'btn btn-sm btn-primary pull-right'])
        ?>
    </h3>
    <?= $this->render('_form', compact('model')) ?>
</div>