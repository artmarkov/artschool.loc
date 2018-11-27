<?php

namespace backend\controllers\calendar;

use common\models\calendar\Event;
use Yii;
use backend\controllers\DefaultController;

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
     * @param null $start
     * @param null $end
     * @param null $_
     * @return array
     */
    public function actionIndex(){

        $events = Event::find()->all();

        $tasks = [];
        foreach ($events as $item){
            //Testing
            $event = new \yii2fullcalendar\models\Event();
            $event->id = $item->id;
            $event->title = $item->title;
            $event->start = date("Y-m-d H:i", (integer) mktime( date("H", $item->start_timestamp), date("i", $item->start_timestamp),0, date("m", $item->start_timestamp), date("d", $item->start_timestamp), date("Y", $item->start_timestamp)));
            $event->end =  date("Y-m-d H:i", (integer) mktime( date("H", $item->end_timestamp), date("i", $item->end_timestamp),0, date("m", $item->end_timestamp), date("d", $item->end_timestamp), date("Y", $item->end_timestamp)));;
            $tasks[] = $event;
        }
           // echo '<pre>' . print_r($tasks, true) . '</pre>';
        return $this->renderIsAjax('index', [
            'events' => $tasks,
        ]);
    }

    /**
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $date = Yii::$app->request->get('date');
        $model = new Event();
        
        $model->start_timestamp = \Yii::$app->formatter->asTimestamp($date);
        $model->end_timestamp = \Yii::$app->formatter->asTimestamp($date);

        if ($model->load(Yii::$app->request->post()) && Yii::$app->request->isAjax) {
            \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

            return \yii\widgets\ActiveForm::validate($model);

        } elseif ($model->load(Yii::$app->request->post()) && $model->save()) {

            Yii::$app->session->setFlash('crudMessage', Yii::t('yee', 'Your item has been created.'));
            return $this->redirect(['index']);
        } else {
            return $this->renderAjax('create', [
                'model' => $model,
                ]);
         }
    }
    /**
     * [actionJsoncalendar description]
     * @param  [type] $start [description]
     * @param  [type] $end   [description]
     * @param  [type] $_     [description]
     * @return [type]        [description]
     */
    public function actionJsoncalendar($start=NULL,$end=NULL,$_=NULL){
        $events = array();
        
        //Demo
        $Event = new \yii2fullcalendar\models\Event();
        $Event->id = 1;
        $Event->title = 'Testing';
        $Event->start = date('Y-m-d\TH:m:s\Z');
        $events[] = $Event;
        $Event = new \yii2fullcalendar\models\Event();
        $Event->id = 2;
        $Event->title = 'Testing';
        $Event->start = date('Y-m-d\TH:m:s\Z',strtotime('tomorrow 8am'));
        $events[] = $Event;
        $event3 = new DateTime('+2days 10am');
        $Event = new \yii2fullcalendar\models\Event();
        $Event->id = 2;
        $Event->title = 'Testing';
        $Event->start = $event3->format('Y-m-d\Th:m:s\Z');
        $Event->end = $event3->modify('+3 hours')->format('Y-m-d\TH:m:s\Z');
        $events[] = $Event;
        header('Content-type: application/json');
        echo Json::encode($events);
        Yii::$app->end();
    }
    
    public function actionAjax(){

     if((Yii::$app->request->post())){
        $codePersonnel = "Ajax Worked!";
        echo $codePersonnel;
    }else{
        $codePersonnel = "Ajax failed";
        echo $codePersonnel;
    }

    // return Json    
    return \yii\helpers\Json::encode($codePersonnel);

  }
}