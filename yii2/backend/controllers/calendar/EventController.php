<?php

namespace backend\controllers\calendar;

use common\models\calendar\Event;
use Yii;
use backend\controllers\DefaultController;
use yii\helpers\Json;

/**
 * EventController implements the CRUD actions for common\models\calendar\Event model.
 */
class EventController extends DefaultController 
{
    public $modelClass       = 'common\models\calendar\Event';
    public $modelSearchClass = '';

    protected function getRedirectPage($action, $model = null)
    {
        switch ($action) {
            case 'update':
                return ['update', 'id' => $model->id];
                break;
            case 'create':
                return ['update', 'id' => $model->id];
                break;
            default:
                return parent::getRedirectPage($action, $model);
        }
    }

    /**
     * @return string|\yii\web\Response
     */
    public function actionIndex(){

        return $this->renderIsAjax('index');
    }

    /**
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {

        $eventData = Yii::$app->request->post('eventData');
        $model = new Event();
        $model->start_timestamp = $eventData['start_timestamp'];
        $model->end_timestamp = $eventData['end_timestamp'];
      //  echo '<pre>' . print_r($model, true) . '</pre>';
        return $this->renderAjax('create', [
                'model' => $model,
                ]);

//        $date = Yii::$app->request->get('date');
//        $model = new Event();
//
//        $model->start_timestamp = \Yii::$app->formatter->asTimestamp($date);
//        $model->end_timestamp = \Yii::$app->formatter->asTimestamp($date);
//
//        if ($model->load(Yii::$app->request->post()) && Yii::$app->request->isAjax) {
//            \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
//
//            return \yii\widgets\ActiveForm::validate($model);
//
//        } elseif ($model->load(Yii::$app->request->post()) && $model->save()) {
//
//            Yii::$app->session->setFlash('crudMessage', Yii::t('yee', 'Your item has been created.'));
//            return $this->redirect(['index']);
//        } else {
//            return $this->renderAjax('create', [
//                'model' => $model,
//                ]);
//         }
    }

    /**
     * @param null $start
     * @param null $end
     * @param null $_
     * @return array
     */
    public function actionCalendar($start=NULL,$end=NULL,$_=NULL){

        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

        $start = Yii::$app->request->get('start');
        $end = Yii::$app->request->get('end');
        $_ = Yii::$app->request->get('_');

        $start_timestamp = Yii::$app->formatter->asTimestamp($start);
        $end_timestamp = Yii::$app->formatter->asTimestamp($end);

        $events = Event::find()
            ->where("start_timestamp > :start_timestamp and end_timestamp < :end_timestamp", [":start_timestamp" => $start_timestamp, ":end_timestamp" => $end_timestamp])
            ->orderBy('start_timestamp')
            ->all();
        $tasks = [];
        foreach ($events as $item){

            $event = new \yii2fullcalendar\models\Event();
            $event->id = $item->id;
            $event->title = $item->title;
            $event->color = '#0EB6A2';
            $event->textColor = '#fff';
            $event->start = date("Y-m-d H:i", (integer) mktime( date("H", $item->start_timestamp), date("i", $item->start_timestamp),0, date("m", $item->start_timestamp), date("d", $item->start_timestamp), date("Y", $item->start_timestamp)));
            $event->end =  date("Y-m-d H:i", (integer) mktime( date("H", $item->end_timestamp), date("i", $item->end_timestamp),0, date("m", $item->end_timestamp), date("d", $item->end_timestamp), date("Y", $item->end_timestamp)));;
            $tasks[] = $event;
        }
       // echo '<pre>' . print_r($tasks, true) . '</pre>';

        return $tasks;
    }

}