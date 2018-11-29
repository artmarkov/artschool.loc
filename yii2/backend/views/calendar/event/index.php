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
            revertDuration: 0  // original position after the drag
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
// выбираем мышкой область или кликаем в пустое поле
$JSSelect = <<<EOF
    function(start, end, jsEvent, view) {
        var eventData;
            eventData = {
                id: undefined,
                start: start.format(),
                end: end.format(),
                allDay: start.allDay,
            };
        $('#w0').fullCalendar('renderEvent', eventData, true);
        console.log('выбираем мышкой область или кликаем в пустое поле');
        console.log(eventData);
      $.ajax({
            url: '/admin/calendar/event/init-event',
            type: 'POST',
            data: {eventData : eventData},
            success: function (res) {
    //            console.log(res);
    //        $('#w0').fullCalendar('renderEvent', eventData, true);
            showDay(res);
            },
            error: function () {
                $('#w0').fullCalendar('unselect');
            }
        });
    }
EOF;
// кликаем по событию
$JSEventClick = <<<EOF
    function(calEvent, jsEvent, view) {

        var eventData;
            eventData = {
                id: calEvent.id,
            };
        console.log('кликаем по событию');
        console.log(eventData);
      $.ajax({
            url: '/admin/calendar/event/init-event',
            type: 'POST',
            data: {eventData : eventData},
            success: function (res) {
               // console.log(res);
            showDay(res);
            },
            error: function () {
                alert('Error!!!');
            }
        });
    }
EOF;
// бросаем событие извне
$JSDrop = <<<EOF
    function(date, jsEvent, ui, resourceId ) {
      if ($('#drop-remove').is(':checked')) {
             $(this).remove();
             }
        var eventData;
            eventData = {
                id: undefined,
                title: ui.helper[0].innerHTML,
                start: date.format(),
                end: null,
            };
        console.log('бросаем событие извне');
        console.log(eventData);
      $.ajax({
            url: '/admin/calendar/event/init-event',
            type: 'POST',
            data: {eventData : eventData},
            success: function (res) {
    //            console.log(res);
            showDay(res);
            },
            error: function () {
                $('#w0').fullCalendar('unselect');
            }
        });

    }
EOF;
// растягиваем/сжимаем событие мышкой
$JSEventResize = <<<EOF
    function(event, delta, revertFunc, jsEvent, ui, view) {
      var eventData;
            eventData = {
                id: event.id,
                title: event.title,
                start: event.start.format(),
                end: event.end.format(),
                allDay: event.allDay,
            };
        console.log('растягиваем/сжимаем событие мышкой');
        console.log(eventData);
      }
EOF;
// перетаскиваем событие, удерживая мышкой
$JSEventDrop = <<<EOF
    function(event, delta, revertFunc, jsEvent, ui, view) {
        var eventData;
            eventData = {
                id: event.id,
                title: event.title,
                start: event.start.format(),
                end: event.end == null ? null : event.end.format(),
                allDay: event.allDay,
            };
      
     console.log('перетаскиваем событие, удерживая мышкой');
     console.log(eventData);
      }
EOF;
?>
            <div class="row">
                <div class="col-md-10">

            <?= \yii2fullcalendar\yii2fullcalendar::widget([
                //'defaultView' => 'basicWeek',
                //'defaultView' => 'basicDay',
                //'defaultView' => 'agendaDay',
                'options' => [
                    'lang' => 'ru',
                ],
                'header' => [
				'left'=> 'prev,next today',
				'center'=> 'title',
				'right'=> 'month,agendaWeek,agendaDay,listMonth',

			],

                'clientOptions' => [

                    'selectable' => true,
                    'selectHelper' => true,
                    'droppable' => true,
                    'editable' => true,
                    'drop' => new JsExpression($JSDrop),
                    'select' => new JsExpression($JSSelect),
                    'eventClick' => new JsExpression($JSEventClick),
                    'eventResize'=> new JsExpression($JSEventResize),
                    'eventDrop'=> new JsExpression($JSEventDrop),
                    'defaultDate' => date('Y-m-d H:i')
              ],

               'events' => \yii\helpers\Url::to(['/calendar/event/calendar']),
            ]);
            ?>
                </div>
                <div class="col-md-2">

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
                </div>
            </div>
        </div>
    </div>
</div>

<?php \yii\bootstrap\Modal::begin([
    'header' => '<h3 class="lte-hide-title page-title">' . Yii::t('yee/calendar', 'Event') . '</h3>',
    'size' => 'modal-lg',
    'id' => 'event-modal',
    //'footer' => 'footer',
]);

\yii\bootstrap\Modal::end(); ?>

<?php
$js = <<<JS

function showDay(res) {
    $('#event-modal .modal-body').html(res);
    $('#event-modal').modal();
}
JS;

$this->registerJs($js);
?>
