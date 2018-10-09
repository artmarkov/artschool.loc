<?php

use common\widgets\ActiveForm;
use common\models\venue\VenueSity;
use yeesoft\helpers\Html;
use common\models\venue\VenueCountry;

/* @var $this yii\web\View */
/* @var $model common\models\venue\VenueSity */
/* @var $form yeesoft\widgets\ActiveForm */
?>

<div class="venue-sity-form">

    <?php
    $form = ActiveForm::begin([
        'id' => 'venue-sity-form',
        'validateOnBlur' => false,
    ])
    ?>

    <div class="row">
        <div class="col-md-9">

            <div class="panel panel-default">
                <div class="panel-body">

                    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'latitude')->textInput() ?>

                    <?= $form->field($model, 'longitude')->textInput() ?>

                </div>

            </div>
        </div>

        <div class="col-md-3">

            <div class="panel panel-default">
                <div class="panel-body">
<!--                    <div class="record-info">-->
                        <div class="form-group clearfix">
                            <label class="control-label"
                                   style="float: left; padding-right: 5px;"><?= $model->attributeLabels()['id'] ?>
                                : </label>
                            <span><?= $model->id ?></span>
                        </div>

                        <?= $form->field($model, 'country_id')
                            ->dropDownList(VenueCountry::getVenueCountryList())
                            ->label(Yii::t('yee/guide', 'Name Country'));
                        ?>

                        <div class="form-group">
                            <?php if ($model->isNewRecord): ?>
                                <?= Html::submitButton(Yii::t('yee', 'Create'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Cancel'), ['/venue-sity/default/index'], ['class' => 'btn btn-default']) ?>
                            <?php else: ?>
                                <?= Html::submitButton(Yii::t('yee', 'Save'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Delete'),
                                    ['/venue-sity/default/delete', 'id' => $model->id], [
                                        'class' => 'btn btn-default',
                                        'data' => [
                                            'confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                                            'method' => 'post',
                                        ],
                                    ]) ?>
                                <?= Html::a(Yii::t('yee', 'Add New'), ['venue/sity/create'],
                                    ['class' => 'btn btn-primary pull-right'])                                ?>

                            <?php endif; ?>
                        </div>
<!--                    </div>-->
                </div>
            </div>

        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
