<?php

namespace backend\controllers\parents;

use Yii;
use common\models\user\User;
use yii\data\ActiveDataProvider;
Use yii\web\NotFoundHttpException;

/**
 * DefaultController implements the CRUD actions for common\models\user\UserCommon model.
 */
class DefaultController extends \backend\controllers\DefaultController
{
    public $modelClass       = 'common\models\user\UserCommon';
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
     * Lists all Company models.
     * @return mixed
     */
    public function actionIndex()
    {
        $dataProvider = new ActiveDataProvider([
            'query' => $model = \common\models\user\UserCommon::find()->andWhere(['user_category' => User::USER_CATEGORY_PARENT]),
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }
    /**
     * Creates a new Company model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */

    public function actionCreate() {
        
        $user_id = Yii::$app->request->get('user_id');
      //  echo '<pre>' . print_r($user_id, true) . '</pre>';

        $model = new $this->modelClass;
        $model->user_id = $user_id;
        
        if ($model->load(Yii::$app->request->post())) {            
            
            $model->user_category = User::USER_CATEGORY_PARENT;
            $model->status = User::STATUS_INACTIVE;
            $model->getDateToTimestamp("-");

            if ($model->save()) {
                if (Yii::$app->request->isAjax) {
                    // JSON response is expected in case of successful save
                    Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
                    return ['success' => true];
                }
                return $this->redirect(['view', 'id' => $model->id]);
            }
        }

        if (Yii::$app->request->isAjax) {
            return $this->renderAjax('create', [
                        'model' => $model,
            ]);
        } else {
            return $this->render('create', [
                        'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Company model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = \common\models\user\UserCommon::findOne(['id' => $id, 'user_category' => User::USER_CATEGORY_PARENT]);
         if (!isset($model)) {
            throw new NotFoundHttpException("The user was not found.");
        }
        if($model->birth_timestamp != NULL) $model->getTimestampToDate($mask = "d-m-Y");
        
       if ($model->load(Yii::$app->request->post())) {
           if($model->birth_date != NULL)  $model->getDateToTimestamp("-");
        if ($model->save()) {             
            if (Yii::$app->request->isAjax) {
                // JSON response is expected in case of successful save
                Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
                return ['success' => true];
            }
            return $this->redirect(['view', 'id' => $model->id]);             
        }
    }

    if (Yii::$app->request->isAjax) {
        return $this->renderAjax('update', [
            'model' => $model,
        ]);
    } else {
        return $this->render('update', [
            'model' => $model,
        ]);
    }
    }
}