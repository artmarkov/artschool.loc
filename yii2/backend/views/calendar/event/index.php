<?php

use common\models\calendar\Event;
use yeesoft\helpers\Html;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Events';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="event-index">

    <div class="row">
        <div class="col-sm-12">
            <h3 class="lte-hide-title page-title"><?=  Html::encode($this->title) ?></h3>
            <?= Html::a(Yii::t('yee', 'Add New'), ['/calendar/event/create'], ['class' => 'btn btn-sm btn-primary']) ?>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-body">


            <?= \yii2fullcalendar\yii2fullcalendar::widget(array(
                'events'=> $events,
            ));
            ?>
        </div>
    </div>
</div>

<?php
$js = <<<JS

function showDay(day) {
    $('#event-modal .modal-body').html(day);
    $('#event-modal').modal();
}

$('.fc-day').on('click', function (e) {

    e.preventDefault();

    var date = $(this).data('date')

    $.ajax({
        url: '/admin/calendar/event/create',
        data: {date: date},
        type: 'GET',
        success: function (res) {
            if (!res)  alert('Error!');
          //  console.log(res);
            showDay(res);
        },
        error: function () {
            alert('Error!');
        }
    });
});


JS;

$this->registerJs($js);
?>

