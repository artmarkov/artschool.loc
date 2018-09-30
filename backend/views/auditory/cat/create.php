<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\AuditoryCat */

$this->title = 'Create Auditory Cat';
$this->params['breadcrumbs'][] = ['label' => 'Auditory Cats', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="auditory-cat-create">
    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>
    <?=  $this->render('_form', compact('model')) ?>
</div>