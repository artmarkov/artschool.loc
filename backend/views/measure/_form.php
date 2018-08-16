<?php

use yeesoft\widgets\ActiveForm;
use backend\models\Measure;
use yeesoft\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Measure */
/* @var $form yeesoft\widgets\ActiveForm */
//echo '<pre>' . print_r($model, true) . '</pre>';
//echo '<pre>' . print_r($model->getEavAttribute('drop')) . '</pre>';
$fieldOptions = [
    'options' => ['class' => 'form-group has-feedback'],
    'inputTemplate' => "{input}<span class='fa fa-pencil form-control-feedback'></span>"
];
?>

<div class="measure-form">

    <?php 
    $form = ActiveForm::begin([
            'id' => 'measure-form',
            'validateOnBlur' => false,
        ])
    ?>

    <div class="row">
        <div class="col-md-9">

            <div class="panel panel-default">
                <div class="panel-body">
                    
                    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'abbr')->textInput(['maxlength' => true]) ?>

                   <!-- --><?php
                   foreach($model->getEavAttributes() as $attr){
                       //echo '<pre>' . print_r($attr, true) . '</pre>';
                       if($model->getEavAttribute($attr)->type_id === 1) echo $form->field($model, $model->getEavAttribute($attr)->name, $fieldOptions)->textInput()->hint($model->getEavAttribute($attr)->description)->label($model->getEavAttribute($attr)->label);
                       else  echo $form->field($model, $model->getEavAttribute($attr)->name)->dropDownList($model->getEavAttribute($model->getEavAttribute($attr)->name)->getEavOptionsList())->hint($model->getEavAttribute($attr)->description)->label($model->getEavAttribute($attr)->label);
                       //echo $form->field($model, $attr->name)->eavInput($attr->type);
                    }

                 ?>

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
                              <?= Html::a(Yii::t('yee', 'Cancel'), ['/measure/default/index'], ['class' => 'btn btn-default']) ?>
                          <?php  else: ?>
                              <?= Html::submitButton(Yii::t('yee', 'Save'), ['class' => 'btn btn-primary']) ?>
                              <?= Html::a(Yii::t('yee', 'Delete'),
                                  ['/measure/default/delete', 'id' => $model->id], [
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
