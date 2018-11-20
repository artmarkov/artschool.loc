<?php

use yii\widgets\LinkPager;
use yii\helpers\Html;
/* @var $this yii\web\View */

$this->title = '#' . $tag->title;
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="tag-index">
    <div class="row">
        <div class="col-md-12">
            <h3 class="lte-hide-title page-title"><?= Html::encode($this->title) ?></h3>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <?php /* @var $post yeesoft\post\models\Post */ ?>
                    <?php foreach ($posts as $post) : ?>
                        <?= $this->render('/items/post.php', ['post' => $post, 'page' => 'tag']) ?>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    </div>
    <div class="text-center">
        <?= LinkPager::widget(['pagination' => $pagination]) ?>
    </div>
</div>
