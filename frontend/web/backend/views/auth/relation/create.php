<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\user\UserRelation */

$this->title = Yii::t('yee/user', 'Create User Relation');
$this->params['breadcrumbs'][] = ['label' => Yii::t('yee/user', 'User Relations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-relation-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
