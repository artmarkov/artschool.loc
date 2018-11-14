<?php

namespace backend\controllers\creative;

use Yii;
use backend\controllers\DefaultController;
use common\models\creative\CreativeWorksAuthor;
use common\models\user\UserCommon;

/**
 * WorksAuthorController implements the CRUD actions for common\models\creative\CreativeWorksAuthor model.
 */
class WorksAuthorController extends DefaultController 
{
    public $modelClass       = 'common\models\creative\CreativeWorksAuthor';
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
     
     public function actionCreateAuthor() {

        $model = new CreativeWorksAuthor();

        if ($modelFamily->load(Yii::$app->request->post())) {

            $user_slave_id = $modelFamily->user_slave_id;
            $user_slave_id != 0 ? $model = UserCommon::findOne($user_slave_id) : $model = new UserCommon();

            if ($model->birth_timestamp != NULL)
                $model->getTimestampToDate("d-m-Y");
            // echo '<pre>' . print_r($model, true) . '</pre>';

            if ($model->load(Yii::$app->request->post()) && Yii::$app->request->isAjax) {
                \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

                return \yii\widgets\ActiveForm::validate($model, $modelFamily);
            } elseif ($model->load(Yii::$app->request->post())) {

                $model->user_category = User::USER_CATEGORY_PARENT;
                if ($model->isNewRecord)
                    $model->status = User::STATUS_INACTIVE;

                if ($model->birth_date != NULL)
                    $model->getDateToTimestamp("-");

                if ($model->save()) {

                    $modelFamily->user_slave_id = $model->id;

                    if ($modelFamily->save()) {
                        Yii::$app->session->setFlash('crudMessage', Yii::t('yee', 'Your item has been updated.'));
                        return $this->redirect(Yii::$app->request->referrer);
                    }
                } else {
                    
                }
            }
        } else {
            throw new HttpException(404, 'Page not found');
        }
    }

    /**
     * Вызывается методом Ajax из worksAuthor.php
     */
    public function actionInitAuthor()
    {
            $id = Yii::$app->request->get('id');
            $author_id = Yii::$app->request->get('author_id');
            $model = new CreativeWorksAuthor();
            $modelUser = new UserCommon();


        //echo '<pre>' . print_r($model, true) . '</pre>';
        //if (empty($model)) return false;

//        if (!Yii::$app->request->isAjax) {
//            return $this->redirect(Yii::$app->request->referrer);
//        }
//        $modelFamily->user_main_id = $id;
//        $modelFamily->user_slave_id = $user_slave_id;
//
//        if($model->birth_timestamp != NULL) $model->getTimestampToDate("d-m-Y");
        $this->layout = false;
        return $this->renderIsAjax('works-author-modal',  ['model' => $model, 'modelUser' => $modelUser]);
    }
    
    public function actionRemove() {
        $id = Yii::$app->request->get('id');        
        $model = CreativeWorksAuthor::findOne($id);
        if (empty($model)) return false;
        $model->delete();
        Yii::$app->session->setFlash('crudMessage', Yii::t('yee', 'Your item has been deleted.'));
        return $this->redirect(Yii::$app->request->referrer); 
    }
}