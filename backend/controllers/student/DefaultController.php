<?php

namespace backend\controllers\student;

use common\models\user\User;
use common\models\user\UserCommon;
use yii\data\ActiveDataProvider;
use yii\web\NotFoundHttpException;
use Yii;


/**
 * DefaultController implements the CRUD actions for common\models\student\Student model.
 */
class DefaultController extends \backend\controllers\DefaultController 
{
    public $modelClass       = 'common\models\student\Student';
    public $modelSearchClass = 'common\models\student\search\StudentSearch';

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

    public function actionCreate() {

        $model = new $this->modelClass;
        $modelUser = new UserCommon();
        $model->setAttributes(
            [
                'sertificate_name' => 'Свидетельство о рождении',
            ]
        );
        if ($modelUser->load(Yii::$app->request->post()) && $model->load(Yii::$app->request->post()) && Yii::$app->request->isAjax) {
            \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

            return \yii\widgets\ActiveForm::validate($model,$modelUser);
        } elseif ($modelUser->load(Yii::$app->request->post()) && $model->load(Yii::$app->request->post())) {

            //echo '<pre>' . print_r($model, true) . '</pre>';
            $modelUser->getDateToTimestamp("-");

            $modelUser->user_category = User::USER_CATEGORY_STUDENT;
            $modelUser->status = User::STATUS_INACTIVE;

            if ($modelUser->save()) {
                $model->user_id = $modelUser->id;
                $model->getDateToTimestamp("-");
                if ($model->save()) {
                    Yii::$app->session->setFlash('crudMessage', Yii::t('yee', 'Your item has been updated.'));
                    return $this->redirect($this->getRedirectPage('update', $model));
                }
            }
        } else {
            return $this->renderIsAjax('create', [
                'modelUser' => $modelUser,
                'model' => $model,
            ]);
        }
    }

    public function actionUpdate($id) {

        $model = $this->findModel($id);
        $modelUser = UserCommon::findOne(['id' => $model->user_id, 'user_category' => User::USER_CATEGORY_STUDENT]);

        if (!isset($model, $modelUser)) {
            throw new NotFoundHttpException("The user was not found.");
        }
        if($modelUser->birth_timestamp != NULL) $modelUser->getTimestampToDate($mask = "d-m-Y");
        if($model->sertificate_timestamp != NULL) $model->getTimestampToDate($mask = "d-m-Y");

        if ($modelUser->load(Yii::$app->request->post()) && $model->load(Yii::$app->request->post()) && Yii::$app->request->isAjax) {
            \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

            return \yii\widgets\ActiveForm::validate($model,$modelUser);
        } elseif ($modelUser->load(Yii::$app->request->post()) && $model->load(Yii::$app->request->post())) {

            //echo '<pre>' . print_r($model, true) . '</pre>';
            if($modelUser->birth_date != NULL)  $modelUser->getDateToTimestamp("-");
            if($model->sertificate_date != NULL)  $model->getDateToTimestamp("-");

            if ($modelUser->save() && $model->save()) {
                Yii::$app->session->setFlash('crudMessage', Yii::t('yee', 'Your item has been updated.'));
                return $this->redirect($this->getRedirectPage('update', $model));
            }
        } else {

            $dataProvider = new ActiveDataProvider([
                'query' => UserCommon::find()
                    ->innerJoin('user_family', 'user.id = user_family.user_slave_id')
                    ->andWhere(['in', 'user_family.user_main_id', $modelUser->id]),
            ]);


            return $this->renderIsAjax('update', [
                'modelUser' => $modelUser,
                'model' => $model,
                'dataProvider' => $dataProvider,
            ]);
        }
    }
}