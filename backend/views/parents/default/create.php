<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\user\UserCommon */

$this->title = 'Create User Common';
$this->params['breadcrumbs'][] = ['label' => 'User Commons', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="user-common-create">
    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>
    <?=  $this->render('_form', compact('model')) ?>
</div>