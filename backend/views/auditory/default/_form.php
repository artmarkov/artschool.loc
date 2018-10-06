<?php

use common\widgets\ActiveForm;
use common\models\Auditory;
use yeesoft\helpers\Html;
use common\models\auditory\AuditoryBuilding;
use common\models\auditory\AuditoryCat;

/* @var $this yii\web\View */
/* @var $model common\models\Auditory */
/* @var $form yeesoft\widgets\ActiveForm */
?>

<div class="auditory-form">

    <?php
    $form = ActiveForm::begin([
        'id' => 'auditory-form',
        'validateOnBlur' => false,
    ])
    ?>

    <div class="row">
        <div class="col-md-9">

            <div class="panel panel-default">
                <div class="panel-body">


                    <?= $form->field($model, 'num')->textInput() ?>

                    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'floor')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'area')->textInput() ?>

                    <?= $form->field($model, 'capacity')->textInput() ?>

                    <?= $form->field($model, 'description')->textInput(['maxlength' => true]) ?>


                </div>

            </div>
        </div>

        <div class="col-md-3">

            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="record-info">
                        <div class="form-group clearfix">
                            <label class="control-label"
                                   style="float: left; padding-right: 5px;"><?= $model->attributeLabels()['id'] ?>
                                : </label>
                            <span><?= $model->id ?></span>

                        </div>
                        <?= $form->field($model, 'building_id')
                            ->dropDownList(AuditoryBuilding::getAuditoryBuildingList())
                            ->label('Name Building');
                        ?>

                        <?= $form->field($model, 'cat_id')
                            ->dropDownList(AuditoryCat::getAuditoryCatList())
                            ->label('Name Category');
                        ?>

                        <?= $form->field($model, 'order')->textInput() ?>

                        <?= $form->field($model, 'study_flag')->checkbox() ?>

                        <div class="form-group">
                            <?php if ($model->isNewRecord): ?>
                                <?= Html::submitButton(Yii::t('yee', 'Create'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Cancel'), ['/auditory/default/index'], ['class' => 'btn btn-default']) ?>
                            <?php else: ?>
                                <?= Html::submitButton(Yii::t('yee', 'Save'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Delete'),
                                    ['/auditory/default/delete', 'id' => $model->id], [
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

    <?php ActiveForm::end(); ?>

</div>
