<?php

use yeesoft\widgets\ActiveForm;
use common\models\teachers\BonusItem;
use common\models\teachers\BonusCategory;
use yeesoft\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\teachers\BonusItem */
/* @var $form yeesoft\widgets\ActiveForm */
?>

<div class="bonus-item-form">

    <?php 
    $form = ActiveForm::begin([
            'id' => 'bonus-item-form',
            'validateOnBlur' => false,
        ])
    ?>

    <div class="row">
        <div class="col-md-9">

            <div class="panel panel-default">
                <div class="panel-body">
                    <?php   echo $form->field($model, 'bonus_category_id')->dropDownList(BonusCategory::getBonusCategoryList(), [
                        'prompt' => Yii::t('yee/teachers','Select Bonus Category...'),
                        'id' => 'bonus_category_id'
                    ])->label(Yii::t('yee/teachers', 'Bonus Category'));
                    ?>

<!--                    --><?//= $form->field($model, 'bonus_category_id')->textInput() ?>

                    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'slug')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'value_default')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'measure_id')->textInput() ?>

                    <?= $form->field($model, 'bonus_rule_id')->textInput() ?>

                    <?= $form->field($model->loadDefaultValues(), 'status')->dropDownList(BonusItem::getStatusList()) ?>

                </div>

            </div>
        </div>

        <div class="col-md-3">

            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="record-info">
                        <div class="form-group clearfix">
                            <label class="control-label" style="float: left; padding-right: 5px;"><?=  $model->attributeLabels()['id'] ?>: </label>
                            <span><?=  $model->id ?></span>
                        </div>

                        <div class="form-group">
                            <?php  if ($model->isNewRecord): ?>
                                <?= Html::submitButton(Yii::t('yee', 'Create'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Cancel'), ['/teachers/bonus-item/index'], ['class' => 'btn btn-default']) ?>
                            <?php  else: ?>
                                <?= Html::submitButton(Yii::t('yee', 'Save'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Delete'),
                                    ['/teachers/bonus-item/delete', 'id' => $model->id], [
                                    'class' => 'btn btn-default',
                                    'data' => [
                                        'confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                                        'method' => 'post',
                                    ],
                                ]) ?>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <?php  ActiveForm::end(); ?>

</div>
