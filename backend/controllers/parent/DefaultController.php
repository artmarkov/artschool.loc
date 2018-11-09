<?php

namespace backend\controllers\parent;

use common\models\user\UserCommon;
use common\models\user\UserFamily;
use Yii;
use common\models\user\User;
use yii\data\ActiveDataProvider;
Use yii\web\NotFoundHttpException;

/**
 * DefaultController implements the CRUD actions for common\models\user\UserCommon model.
 */
class DefaultController extends \backend\controllers\DefaultController {

    public $modelClass = 'common\models\user\UserCommon';
    public $modelSearchClass = '';

    protected function getRedirectPage($action, $model = null) {
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
     * Lists all UserCommon models.
     * @return mixed
     */
    public function actionIndex() {
        $dataProvider = new ActiveDataProvider([
            'query' => $model = \common\models\user\UserCommon::find()->andWhere(['user_category' => User::USER_CATEGORY_PARENT]),
        ]);

        return $this->render('index', [
                    'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Добавляется родитель в базу и формируется родственная связь
     * Запускается из формы редактирования model Student из Модального окна parent-modal
     * Модал находится в layouts main
     */
    public function actionCreateFamily() {

        $modelFamily = new UserFamily();
        $modelFamily->load(Yii::$app->request->post());

        $user_slave_id = $modelFamily->user_slave_id;
        $user_slave_id != 0 ? $model = UserCommon::findOne($user_slave_id) : $model = new UserCommon();

        if($model->birth_timestamp != NULL) $model->getTimestampToDate("d-m-Y");
     // echo '<pre>' . print_r($model, true) . '</pre>';

        if ($model->load(Yii::$app->request->post()) && Yii::$app->request->isAjax) {
            \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

            return \yii\widgets\ActiveForm::validate($model,$modelFamily);
        } elseif ($model->load(Yii::$app->request->post())) {

            $model->user_category = User::USER_CATEGORY_PARENT;
            if ($model->isNewRecord) $model->status = User::STATUS_INACTIVE;

            if($model->birth_date != NULL)   $model->getDateToTimestamp("-");

            if ($model->save()) {

                $modelFamily->user_slave_id = $model->id;

                if ($modelFamily->save()) {
                    Yii::$app->session->setFlash('crudMessage', Yii::t('yee', 'Your item has been updated.'));
                    return $this->redirect(Yii::$app->request->referrer);
                }
            }
            else {

            }
        } else {
            throw new HttpException(404, 'Page not found');
        }
    }
    /**
     * Вызывается методом Ajax из main.js
     */
    public function actionInitFamily()
    {
            $id = Yii::$app->request->get('id');
            $user_slave_id = Yii::$app->request->get('user_slave_id');
            $user_slave_id != 0 ? $model = UserCommon::findOne($user_slave_id) : $model = new UserCommon();
            $modelFamily = new UserFamily();


        //echo '<pre>' . print_r($model, true) . '</pre>';
        //if (empty($model)) return false;

        if (!Yii::$app->request->isAjax) {
            return $this->redirect(Yii::$app->request->referrer);
        }
        $modelFamily->user_main_id = $id;
        $modelFamily->user_slave_id = $user_slave_id;

        if($model->birth_timestamp != NULL) $model->getTimestampToDate("d-m-Y");
        $this->layout = false;
        return $this->renderIsAjax('parents-modal',  ['model' => $model, 'modelFamily' => $modelFamily]);
     // echo '<pre>' . print_r($model, true) . '</pre>';
    }

}
