<?php
/* @var $this yii\web\View */

use yeesoft\comments\widgets\Comments;
use yeesoft\page\models\Page;
use yii\helpers\Html;

$this->title = $page->title;
$this->params['breadcrumbs'][] = $page->title;
?>

<div class="page">
    <div class="row">
        <div class="col-md-12">
            <h3 class="lte-hide-title page-title"><?= Html::encode($page->title) ?></h3>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <?= $page->content ?>

                </div>
            </div>
        </div>
    </div>
</div>
    <?php if ($page->comment_status == Page::COMMENT_STATUS_OPEN): ?>
        <?php echo Comments::widget(['model' => Page::className(), 'model_id' => $page->id]); ?>
    <?php endif; ?>

