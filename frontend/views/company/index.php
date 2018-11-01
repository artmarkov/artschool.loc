<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use lo\widgets\modal\ModalAjax;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Companies';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="company-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <p>      
        <?php
        echo ModalAjax::widget([
            'id' => 'createCompany',
            'header' => 'Create Company',
            'toggleButton' => [
                'label' => 'New ModalAjax',
                'class' => 'btn btn-default'
            ],
            'url' => Url::to(['/company/create']), // Ajax view with form to load
            'ajaxSubmit' => true, // Submit the contained form as ajax, true by default
            // ... any other yii2 bootstrap modal option you need
            'size' => ModalAjax::SIZE_LARGE,
            //'options' => ['class' => 'header-primary'],
            'autoClose' => true,
            'pjaxContainer' => '#grid-company-pjax',
        ]);
        ?>
    </p>

    <?php
    echo ModalAjax::widget([
        'id' => 'updateCompany',
        'selector' => 'a.btn', // all buttons in grid view with href attribute
        'size' => ModalAjax::SIZE_LARGE,
        // 'options' => ['class' => 'header-primary'],
        'autoClose' => true,
        'pjaxContainer' => '#grid-company-pjax',
        'events' => [
            ModalAjax::EVENT_MODAL_SHOW => new \yii\web\JsExpression("
            function(event, data, status, xhr, selector) {
                selector.addClass('warning');
            }
       "),
//            ModalAjax::EVENT_MODAL_SUBMIT => new \yii\web\JsExpression("
//            function(event, data, status, xhr, selector) {
//                if(status){
//                    if(selector.data('scenario') == 'hello'){
//                        alert('hello');
//                    } else {
//                        alert('goodbye');
//                    }
//                    $(this).modal('toggle');
//                }
//            }
//        "),
        ]
    ]);
    ?>
    <?php
//Grid example with data-scenario

    Pjax::begin([
        'id' => 'grid-company-pjax',
        'timeout' => 5000,
    ]);

    echo GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'id',
            'name',
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]);
 ?>
    <a class="btn btn-success" href="/company/update?id=1" title="Edit ID-10" data-scenario="hello">Hello ModalAjax</a>
    <a class="btn btn-default" href="/company/update?id=2" title="Edit ID-20" data-scenario="goodbye">Goodbye ModalAjax</a>
    
    <?php
    Pjax::end();
    ?> 
   

</div>
