<?php

use yii\helpers\Url;
use yii\widgets\Pjax;
use yeesoft\grid\GridView;
use yeesoft\grid\GridQuickLinks;
use common\models\student\Student;
use yeesoft\helpers\Html;
use yeesoft\grid\GridPageSize;
use common\models\user\UserCommon;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('yee/students', 'Students');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="student-index">

    <div class="row">
        <div class="col-sm-12">
            <h3 class="lte-hide-title page-title"><?= Html::encode($this->title) ?></h3>
            <?= Html::a(Yii::t('yee', 'Add New'), ['/student/default/create'], ['class' => 'btn btn-sm btn-primary']) ?>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-body">

            <div class="row">
                <div class="col-sm-6">
                    <?php
                    /* Uncomment this to activate GridQuickLinks */
                    /* echo GridQuickLinks::widget([
                        'model' => Student::className(),
                        'searchModel' => $searchModel,
                    ])*/
                    ?>
                </div>

                <div class="col-sm-6 text-right">
                    <?= GridPageSize::widget(['pjaxId' => 'student-grid-pjax']) ?>
                </div>
            </div>

            <?php
            Pjax::begin([
                'id' => 'student-grid-pjax',
            ])
            ?>

            <?=
            GridView::widget([
                'id' => 'student-grid',
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'bulkActionOptions' => [
                    'gridId' => 'student-grid',
                    'actions' => [Url::to(['bulk-delete']) => Yii::t('yee', 'Delete')] //Configure here you bulk actions
                ],
                'columns' => [
                    ['class' => 'yeesoft\grid\CheckboxColumn', 'options' => ['style' => 'width:10px']],
                    [
                        'class' => 'yeesoft\grid\columns\TitleActionColumn',
                        'options' => ['style' => 'width:300px'],
                        'attribute' => 'studentsFullName',
                        'controller' => '/student/default',
                        'title' => function (Student $model) {
                            return Html::a($model->studentsFullName, ['update', 'id' => $model->id], ['data-pjax' => 0]);
                        },
                        'buttonsTemplate' => '{update} {delete}',
                    ],

                    [
                        'options' => ['style' => 'width:200px'],
                        'attribute' => 'position_id',
                        'value' => 'position.name',
                        'label' => Yii::t('yee/student', 'Name Position'),
                        'filter' => common\models\student\StudentPosition::getPositionList(),
                    ],
                    'user.phone',
                    'user.email',  
                     [
                        'class' => 'yeesoft\grid\columns\DateFilterColumn',
                        'attribute' => 'birth_timestamp',
                        'value' => function (Student $model) {
                            return '<span style="font-size:85%;" class="label label-'
                            . ((time() >= $model->user->birth_timestamp) ? 'primary' : 'default') . '">'
                            . $model->birthDate . '</span>';
                        },
                        'label' => Yii::t('yee', 'Birth Date'),
                        'format' => 'raw',
                        'options' => ['style' => 'width:150px'],
                    ],           
                   
                ],
                    ]);
            ?>

            <?php Pjax::end() ?>
        </div>
    </div>
</div>


