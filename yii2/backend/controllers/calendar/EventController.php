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
        foreach ($events AS $item){
            //Testing
            $event = new \yii2fullcalendar\models\Event();
            $event->id = $item->id;
            $event->title = $item->title;
            $event->start = $item->created_date;
            $tasks[] = $event;
        }

        return $this->render('index', [
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
        $model->created_date = $date;

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
}