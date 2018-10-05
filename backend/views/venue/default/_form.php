<?php

use common\widgets\ActiveForm;
use common\models\venue\VenuePlace;
use yeesoft\helpers\Html;
use yii\widgets\MaskedInput;
use common\models\venue\VenueCountry;
use common\models\venue\VenueDistrict;
use common\models\venue\VenueSity;

/* @var $this yii\web\View */
/* @var $model common\models\venue\VenuePlace */
/* @var $form yeesoft\widgets\ActiveForm */
?>

<div class="venue-place-form">

    <?php
    $form = ActiveForm::begin([
        'id' => 'venue-place-form',
        'validateOnBlur' => false,
    ])
    ?>

    <div class="row">
        <div class="col-md-9">

            <div class="panel panel-default">
                <div class="panel-body">

                    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'phone')->widget(MaskedInput::className(), ['mask' => '+7 (999) 999 99 99',])->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'phone_optional')->widget(MaskedInput::className(), ['mask' => '+7 (999) 999 99 99',])->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'сontact_person')->textInput(['maxlength' => true]) ?>

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
                        <?= $form->field($model, 'country_id')
                            ->dropDownList(VenueCountry::getVenueCountryList())
                            ->label(VenueCountry::attributeLabels()['name']);
                        ?>
                        <?= $form->field($model, 'sity_id')
                            ->dropDownList(VenueSity::getVenueSityList())
                            ->label(VenueSity::attributeLabels()['name']);
                        ?>
                        <?= $form->field($model, 'district_id')
                            ->dropDownList(VenueDistrict::getVenueDistrictList())
                            ->label(VenueDistrict::attributeLabels()['name']);
                        ?>

                        <?= $form->field($model, 'latitude')->widget(MaskedInput::className(), ['mask' => '99.999999',])->textInput() ?>

                        <?= $form->field($model, 'longitude')->widget(MaskedInput::className(), ['mask' => '99.999999',])->textInput() ?>

                        <div class="form-group">
                            <?php if ($model->isNewRecord): ?>
                                <?= Html::submitButton(Yii::t('yee', 'Create'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Cancel'), ['/venue-place/default/index'], ['class' => 'btn btn-default']) ?>
                            <?php else: ?>
                                <?= Html::submitButton(Yii::t('yee', 'Save'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Delete'),
                                    ['/venue-place/default/delete', 'id' => $model->id], [
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
            <?php ActiveForm::end(); ?>

            <?php if (!$model->isNewRecord): ?>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="record-info">

                            <div class="form-group clearfix">
                                <label class="control-label" style="float: left; padding-right: 5px;">
                                    <?= $model->attributeLabels()['created_at'] ?> :
                                </label>
                                <span><?= $model->createdDatetime; ?></span>
                                <span><?= $model->createdBy->username ?></span>
                            </div>
                            <div class="form-group clearfix">
                                <label class="control-label" style="float: left; padding-right: 5px;">
                                    <?= $model->attributeLabels()['updated_at'] ?> :
                                </label>
                                <span><?= $model->updatedDatetime; ?></span>
                                <span><?= $model->updatedBy->username ?></span>
                            </div>

                        </div>
                    </div>
                </div>

            <?php endif; ?>

        </div>
    </div>
</div>
