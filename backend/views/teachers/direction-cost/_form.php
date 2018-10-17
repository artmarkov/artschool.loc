<?php

use yeesoft\widgets\ActiveForm;
use common\models\teachers\Stake;
use common\models\teachers\Direction;
use yeesoft\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\teachers\DirectionCost */
/* @var $form yeesoft\widgets\ActiveForm */
?>

<div class="direction-cost-form">

    <?php 
    $form = ActiveForm::begin([
            'id' => 'direction-cost-form',
            'validateOnBlur' => false,
        ])
    ?>

    <div class="row">
        <div class="col-md-9">

            <div class="panel panel-default">
                <div class="panel-body">
                    
                    <?= $form->field($model, 'teachers_id')->textInput() ?>

                    <?php   echo $form->field($model, 'direction_id')->dropDownList(Direction::getDirectionList(), [
                        'prompt' => Yii::t('yee/teachers','Select Direction...'),
                        'id' => 'direction_id'
                    ])->label(Yii::t('yee/teachers', 'Name Direction'));
                    ?>

                    <?php   echo $form->field($model, 'stake_id')->dropDownList(Stake::getStakeList(), [
                        'prompt' => Yii::t('yee/teachers','Select Stake...'),
                        'id' => 'stake_id'
                    ])->label(Yii::t('yee/teachers', 'Name Stake'));
                    ?>


                    <?= $form->field($model, 'main_flag')->checkbox() ?>

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
                                <?= Html::a(Yii::t('yee', 'Cancel'), ['/teachers/direction-cost/index'], ['class' => 'btn btn-default']) ?>
                            <?php  else: ?>
                                <?= Html::submitButton(Yii::t('yee', 'Save'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Delete'),
                                    ['/teachers/direction-cost/delete', 'id' => $model->id], [
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
