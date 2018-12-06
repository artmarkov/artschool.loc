<?php
use yii\web\JsExpression;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel common\models\service\CatalogSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('yee/service', 'Catalogs');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="catalog-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php
    

//echo '<pre>' . print_r($data, true) . '</pre>';
echo \wbraganca\fancytree\FancytreeWidget::widget([
	'options' =>[
		'source' => $data,
		'extensions' => ['dnd'],
		'dnd' => [
			'preventVoidMoves' => true,
			'preventRecursiveMoves' => true,
			'autoExpandMS' => 400,
			'dragStart' => new JsExpression('function(node, data) {
                           // console.log(node);
				return true;
			}'),
			'dragEnter' => new JsExpression('function(node, data) {
                            //console.log(node);
				return true;
			}'),
			'dragDrop' => new JsExpression('function(node, data) {
                            console.log(data);
				$.get("/admin/service/catalog/move", { 
                                    item: data.otherNode.key.substr(1),
                                    action: data.hitMode,
                                    second: node.key.substr(1) 
                                }, 
                                    function() {
                                    data.otherNode.moveTo(node, data.hitMode);
                                });
			}'),
		],
            'activate' => new JsExpression('function(event, data) {
                //console.log(data);
                var title = data.node.title;
                var id = data.node.key.substr(1);
                
                $("#cat-info .box-header>h3").text(title);
                $.get("/admin/service/catalog/view-ajax",
                {id: id},
                function(data) {
                 $("#cat-info .box-body").html(data);
                    });
            }'),
	]
]);
?>
</div>
<div class="catalog-form" id ="cat-info">
    <div class="box-header">
    <h3 class="box-title">info</h3>

        
        <div class="box-body">
            
        </div>
    </div>
</div>