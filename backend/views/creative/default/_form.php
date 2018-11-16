<?php

use yeesoft\widgets\ActiveForm;
use common\models\creative\CreativeWorks;
use common\models\creative\CreativeCategory;
use common\models\user\User;
use yeesoft\helpers\Html;
use kartik\date\DatePicker;

/* @var $this yii\web\View */
/* @var $model common\models\creative\CreativeWorks */
/* @var $form yeesoft\widgets\ActiveForm */
?>

<div class="creative-works-form">

    <?php 
    $form = ActiveForm::begin([
            'id' => 'creative-works-form',
            'validateOnBlur' => false,
        ])
    ?>

    <div class="row">
        <div class="col-md-9">

            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <?= $form->field($model, 'name')->textarea(['rows' => 3]) ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-12">
                    <?php
                    echo $form->field($model, 'department_list')->widget(\nex\chosen\Chosen::className(), [
                        'items' => CreativeWorks::getDepartmentList(),
                        'multiple' => true,
                        'placeholder' => Yii::t('yee/teachers', 'Select Department...'),
                    ])->label(Yii::t('yee/guide', 'Department'));
                    ?>
                </div>
               
            </div>
            <div class="row">
                <div class="col-md-12">
                    <?php if (!$model->isNewRecord) : ?>
                <?= \backend\widgets\WorksAuthorWidget::widget(['model' => $model]); ?>
            <?php endif; ?>
                </div>
               
            </div>
        </div>

        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="record-info">
                        <?php if (!$model->isNewRecord): ?>

                            <div class="form-group clearfix">
                                <label class="control-label" style="float: left; padding-right: 5px;">
                                    <?= $model->attributeLabels()['created_at'] ?> :
                                </label>
                                <span><?= $model->createdDatetime ?></span>
                            </div>

                            <div class="form-group clearfix">
                                <label class="control-label" style="float: left; padding-right: 5px;">
                                    <?= $model->attributeLabels()['updated_at'] ?> :
                                </label>
                                <span><?= $model->updatedDatetime ?></span>
                            </div>

                            <div class="form-group clearfix">
                                <label class="control-label" style="float: left; padding-right: 5px;">
                                    <?= $model->attributeLabels()['updated_by'] ?> :
                                </label>
                                <span><?= $model->updatedBy->username ?></span>
                            </div>

                        <?php endif; ?>

                        <div class="form-group">
                            <?php  if ($model->isNewRecord): ?>
                                <?= Html::submitButton(Yii::t('yee', 'Create'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Cancel'), ['/creative/default/index'], ['class' => 'btn btn-default']) ?>
                            <?php  else: ?>
                                <?= Html::submitButton(Yii::t('yee', 'Save'), ['class' => 'btn btn-primary']) ?>
                                <?= Html::a(Yii::t('yee', 'Delete'),
                                    ['/creative/default/delete', 'id' => $model->id], [
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
            <div class="panel panel-default">
                <div class="panel-body">

                    <div class="record-info">
                        <?= $form->field($model, 'category_id')->dropDownList(CreativeCategory::getCreativeCategoryList(), ['prompt' => '', 'encodeSpaces' => true]) ?>
                        
                        <?php  if($model->published_at) $model->published_at = date("d-m-Y", (integer) mktime(0,0,0, date("m", $model->published_at), date("d", $model->published_at), date("Y", $model->published_at)));  ?>

                        <?= $form->field($model, 'published_at')->widget(DatePicker::classname(), [
                                     'type' => DatePicker::TYPE_INPUT,
                                     'options' => ['placeholder' => ''],
                                     'convertFormat' => true,
                                     //'value'=> date("d-m-Y",(integer) $model->published_at),
                                     'pluginOptions' => [
                                         'format' => 'dd-MM-yyyy',
                                         'autoclose' => true,
                                         'weekStart' => 1,
                                         'startDate' => '01-01-1930',
                                         'endDate' => '01-01-2030',
                                         'todayBtn' => 'linked',
                                         'todayHighlight' => true,
                                     ]
                                    ]);
                        ?>
                        <?= $form->field($model, 'status')->dropDownList(CreativeWorks::getStatusList()) ?>

                        <?php if (!$model->isNewRecord): ?>
                            <?= $form->field($model, 'created_by')->dropDownList(User::getUsersList()) ?>
                        <?php endif; ?>

                        <?= $form->field($model, 'comment_status')->dropDownList(CreativeWorks::getCommentStatusList()) ?>                       

                    </div>
                </div>
            </div>

        </div>
    </div>

    <?php  ActiveForm::end(); ?>

</div>
