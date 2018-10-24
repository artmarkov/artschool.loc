<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\subject\SubjectType */

$this->title = 'Create Subject Type';
$this->params['breadcrumbs'][] = ['label' => 'Subject Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="subject-type-create">
    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>
    <?=  $this->render('_form', compact('model')) ?>
</div>