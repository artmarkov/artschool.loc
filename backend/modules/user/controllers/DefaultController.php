<?php

namespace backend\modules\user\controllers;

use common\models\user\User;
use yeesoft\controllers\admin\BaseController;
use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use common\models\teachers\Teachers;
use common\models\student\Student;

/**
 * DefaultController implements the CRUD actions for User model.
 */
class DefaultController extends BaseController {

    /**
     * @var User
     */
    public $modelClass = 'common\models\user\User';
    public $layout = '@backend/views/layouts/main.php';

    /**
     * @var UserSearch
     */
    public $modelSearchClass = 'backend\modules\user\models\search\UserSearch';
    public $disabledActions = ['view'];

    protected function getRedirectPage($action, $model = null) {
        switch ($action) {
            case 'delete':
                return ['index'];
                break;
            case 'update':
                return ['update', 'id' => $model->id];
                break;
            case 'create':
                return ['update', 'id' => $model->id];
                break;
            default:
                return ['index'];
        }
    }

    /**
     * @return mixed|string|\yii\web\Response
     */
    public function actionCreate() {
        $model = new User(['scenario' => 'newUser']);

        if ($model->load(Yii::$app->request->post())) {
            $model->getDateToTimestamp("-");

            if ($model->save()) {
                return $this->redirect(['update', 'id' => $model->id]);
            }
        }

        return $this->renderIsAjax('create', compact('model'));
    }

    /**
     * @param int $id User ID
     *
     * @throws \yii\web\NotFoundHttpException
     * @return string
     */
    public function actionChangePassword($id) {
        $model = User::findOne($id);

        if (!$model) {
            throw new NotFoundHttpException(Yii::t('yee/user', 'User not found'));
        }

        $model->scenario = 'changePassword';

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('crudMessage', Yii::t('yee/auth', 'Password has been updated'));
            return $this->redirect(['change-password', 'id' => $model->id]);
        }

        return $this->renderIsAjax('changePassword', compact('model'));
    }

    /**
     * Updates an existing model.
     * If update is successful, the browser will be redirected to the 'view' page.
     *
     * @param integer $id
     *
     * @return mixed
     */
    public function actionUpdate($id) {
        /* @var $model \yeesoft\db\ActiveRecord */
        $model = $this->findModel($id);

        if (!isset($model)) {
            throw new NotFoundHttpException("The user was not found.");
        }

       $model->getTimestampToDate("d-m-Y");

        if ($model->load(Yii::$app->request->post())) {

            $model->getDateToTimestamp("-");

            if ($model->save()) {
                Yii::$app->session->setFlash('crudMessage', Yii::t('yee', 'Your item has been updated.'));
            }
        }
        return $this->renderIsAjax($this->updateView, compact('model'));
    }

    /**
     * Добавляем связанную таблицу 
     * в зависимости от user_category модели User
     * 
     */
    public function createSlaveUserTable($model) {
        switch ($model->user_category) {
            case User::USER_CATEGORY_TEACHER:
                if (empty(Teachers::findOne($model->id))) {

                    $model_slug = new Teachers();
                    $model_slug->id = $model->id;
                    $model_slug->save(false);
                }
                break;

            case User::USER_CATEGORY_STUDENT:
                if (empty(Student::findOne($model->id))) {

                    $model_slug = new Student();
                    $model_slug->id = $model->id;
                    $model_slug->save(false);
                }
                break;

            default:
                return FALSE;
        }
    }

}
