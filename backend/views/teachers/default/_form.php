<?php

use yeesoft\widgets\ActiveForm;
use common\models\teachers\Teachers;
use yeesoft\helpers\Html;
use kartik\date\DatePicker;

/* @var $this yii\web\View */
/* @var $teachers common\models\teachers\Teachers */
/* @var $form yeesoft\widgets\ActiveForm */
?>

<div class="teachers-form">

    <?php
    $form = ActiveForm::begin([
                'id' => 'teachers-form',
                'validateOnBlur' => false,
            ])
    ?>

    <div class="row">
        <div class="col-md-9">

            <div class="panel panel-default">
                <div class="panel-body">

                    <div class="row">
                        <div class="col-md-6">
                            <?= $form->field($teachers, 'timestamp_serv')->textInput() ?>
                        </div>
                        <div class="col-md-6">
                            <?php
                            echo $form->field($teachers, 'time_serv_init')->widget(DatePicker::classname(), [
                                'options' => ['placeholder' => 'dd-mm-yyyy'],
                                'pluginOptions' => [
                                    'autoclose' => true,
                                    'format' => 'dd-mm-yyyy'
                                ]
                            ])->label(Yii::t('yee/teachers', 'For date'));
                            ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <?= $form->field($teachers, 'timestamp_serv_spec')->textInput() ?>
                        </div>
                        <div class="col-md-6">
                            <?php
                            echo $form->field($teachers, 'time_serv_spec_init')->widget(DatePicker::classname(), [
                                'options' => ['placeholder' => 'dd-mm-yyyy'],
                                'pluginOptions' => [
                                    'autoclose' => true,
                                    'format' => 'dd-mm-yyyy'
                                ]
                            ])->label(Yii::t('yee/teachers', 'For date'));
                            ?>

                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-body">

<!--                    --><?//= $form->field($teachers, 'teachers_id')->textInput() ?>

                    <?php   echo $form->field($directionCost, 'direction_id')->dropDownList(\common\models\teachers\Direction::getDirectionList(), [
                        'prompt' => Yii::t('yee/teachers','Select Direction...'),
                        'id' => 'direction_id'
                    ])->label(Yii::t('yee/teachers', 'Name Direction'));
                    ?>

                    <?php   echo $form->field($directionCost, 'stake_id')->dropDownList(\common\models\teachers\Stake::getStakeList(), [
                        'prompt' => Yii::t('yee/teachers','Select Stake...'),
                        'id' => 'stake_id'
                    ])->label(Yii::t('yee/teachers', 'Name Stake'));
                    ?>


                    <?= $form->field($directionCost, 'main_flag')->checkbox() ?>

                </div>

            </div>

        </div>

        <div class="col-md-3">

            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="record-info">
                        <div class="form-group clearfix">
                            <label class="control-label" style="float: left; padding-right: 5px;"><?= $teachers->attributeLabels()['id'] ?>: </label>
                            <span><?= $teachers->id ?></span>
                        </div>
                        <?php
                        echo $form->field($teachers, 'position_id')->dropDownList(common\models\teachers\Position::getPositionList(), [
                            'prompt' => Yii::t('yee/teachers', 'Select Position...'),
                            'id' => 'position_id'
                        ])->label(Yii::t('yee/teachers', 'Name Position'));
                        ?>

                        <?php
                        echo $form->field($teachers, 'work_id')->dropDownList(common\models\teachers\Work::getWorkList(), [
                            'prompt' => Yii::t('yee/teachers', 'Select Work...'),
                            'id' => 'work_id'
                        ])->label(Yii::t('yee/teachers', 'Name Work'));
                        ?>

                        <?php
                        echo $form->field($teachers, 'level_id')->dropDownList(common\models\teachers\Level::getLevelList(), [
                            'prompt' => Yii::t('yee/teachers', 'Select Level...'),
                            'id' => 'level_id'
                        ])->label(Yii::t('yee/teachers', 'Name Level'));
                        ?>
                        <?= $form->field($teachers, 'tab_num')->textInput(['maxlength' => true]) ?>

                        <div class="form-group">
                            <?php if ($teachers->isNewRecord): ?>
                                <?= Html::submitButton(Yii::t('yee', 'Create'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Cancel'), ['/teachers/default/index'], ['class' => 'btn btn-default']) ?>
                            <?php else: ?>
                                <?= Html::submitButton(Yii::t('yee', 'Save'), ['class' => 'btn btn-primary']) ?>
                                <?=
                                Html::a(Yii::t('yee', 'Delete'), ['/teachers/default/delete', 'id' => $teachers->id], [
                                    'class' => 'btn btn-default',
                                    'data' => [
                                        'confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                                        'method' => 'post',
                                    ],
                                ])
                                ?>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
