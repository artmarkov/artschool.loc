<?php

use common\models\calendar\Event;
use yeesoft\helpers\Html;
use yii\widgets\Pjax;
use yii\web\JsExpression;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

//echo '<pre>' . print_r($events, true) . '</pre>';

$this->title = 'Events';
$this->params['breadcrumbs'][] = $this->title;

$DragJS = <<<EOF
/* initialize the external events
-----------------------------------------------------------------*/
$('#external-events .fc-event').each(function() {
    // store data so the calendar knows to render an event upon drop
    $(this).data('event', {
        title: $.trim($(this).text()), // use the element's text as the event title
        stick: true // maintain when user navigates (see docs on the renderEvent method)
    });
    // make the event draggable using jQuery UI
    $(this).draggable({
        zIndex: 999,
        revert: true,      // will cause the event to go back to its
        revertDuration: 0  //  original position after the drag
    });
});
EOF;
$this->registerJs($DragJS);
?>
<div class="event-index">

    <div class="row">
        <div class="col-sm-12">
            <h3 class="lte-hide-title page-title"><?=  Html::encode($this->title) ?></h3>
            
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-body">
<?php 
            Pjax::begin()
            ?>
<?php
$JSCode = <<<EOF
function(start, end) {
    var title = prompt('Event Title:');
    var eventData;
    if (title) {
        eventData = {
            title: title,
            start: start,
            end: end
        };
        $('#w0').fullCalendar('renderEvent', eventData, true);
    }
    $('#w0').fullCalendar('unselect');
}
EOF;
$JSDropEvent = <<<EOF
function(date) {
    alert("Dropped on " + date.format());
    if ($('#drop-remove').is(':checked')) {
        // if so, remove the element from the "Draggable Events" list
        $(this).remove();
    }
}
EOF;
$JSEventClick = <<<EOF
function(calEvent, jsEvent, view) {
    alert('Event: ' + calEvent.title);
    alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
    alert('View: ' + view.name);
    // change the border color just for fun
    $(this).css('border-color', 'red');
}
EOF;
    
    ?>
            <div id="external-events">
    <h4>Draggable Events</h4>
    <div class="fc-event ui-draggable ui-draggable-handle">My Event 1</div>
    <div class="fc-event ui-draggable ui-draggable-handle">My Event 2</div>
    <div class="fc-event ui-draggable ui-draggable-handle">My Event 3</div>
    <div class="fc-event ui-draggable ui-draggable-handle">My Event 4</div>
    <div class="fc-event ui-draggable ui-draggable-handle">My Event 5</div>
    <p>
        <input type="checkbox" id="drop-remove">
        <label for="drop-remove">remove after drop</label>
    </p>
</div>
            <?= \yii2fullcalendar\yii2fullcalendar::widget([
                'header' => [
				'left'=> 'prev,next today',
				'center'=> 'title',
				'right'=> 'month,agendaWeek,agendaDay'
			],
			
                'events'=> $events,
                'clientOptions' => [
                    'selectable' => true,
                    'selectHelper' => true,
                    'droppable' => true,
                    'editable' => true,
                    'drop' => new JsExpression($JSDropEvent),
                    'select' => new JsExpression($JSCode),
                    'eventClick' => new JsExpression($JSEventClick),
                    'defaultDate' => date('Y-m-d H:i')
              ],
              // 'ajaxEvents' => \yii\helpers\Url::toRoute(['/admin/calendar/event/create']),
                       ]);
            ?>
             <?php Pjax::end() ?>
        </div>
    </div>
</div>
<div class="well"> 
<pre>
Event Hover:
<?= Html::encode($JSCode); ?>

Event Click:
<?= Html::encode($JSEventClick); ?>    
</pre>
</div>
 <?php \yii\bootstrap\Modal::begin([
            'header' => '<h3 class="lte-hide-title page-title">' . Yii::t('yee/calendar', 'Event') . '</h3>',
            'size' => 'modal-lg',
            'id' => 'event-modal',
            //'footer' => 'footer',
        ]);

        \yii\bootstrap\Modal::end(); ?>

<?php
//$js = <<<JS
//
//function showDay(day) {
//    $('#event-modal .modal-body').html(day);
//    $('#event-modal').modal();
//}
//
//$('.fc-day').on('click', function (e) {
//
//    e.preventDefault();
//
//    var date = $(this).data('date')
//
//    $.ajax({
//        url: '/admin/calendar/event/create',
//        data: {date: date},
//        type: 'GET',
//        success: function (res) {
//            if (!res)  alert('Error!');
//          //  console.log(res);
//            showDay(res);
//        },
//        error: function () {
//            alert('Error!');
//        }
//    });
//});
//
//
//JS;
//
//$this->registerJs($js);
?>

