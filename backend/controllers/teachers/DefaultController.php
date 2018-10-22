<?php

namespace backend\controllers\teachers;

use common\models\teachers\Stake;
use common\models\teachers\Cost;
use common\models\teachers\Teachers;
use Yii;

/**
 * DefaultController implements the CRUD actions for common\models\teachers\Teachers model.
 */
class DefaultController extends \backend\controllers\DefaultController {

    public $modelClass = 'common\models\teachers\Teachers';
    public $modelSearchClass = 'common\models\teachers\search\TeachersSearch';

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
     * на 1 сентября текущего года  - в следующем году данные по стажу автоматически обновятся 
     * (в базе ничего не меняется)
     * хранится условная временная метка
     */
    public function actionUpdate($id) {

        $year_sec = 31536000;
        $this_time = mktime(0, 0, 0, 9, 1, date('Y', time()));

        $model = $this->findModel($id);

        if ($model->cost_main_id != NULL)
            $model->direction_id_main = Cost::getDirectionId($model->cost_main_id)->direction_id;
        if ($model->cost_main_id != NULL)
            $model->stake_id_main = Cost::getStakeId($model->cost_main_id)->stake_id;

        if ($model->cost_optional_id != NULL)
            $model->direction_id_optional = Cost::getDirectionId($model->cost_optional_id)->direction_id;
        if ($model->cost_optional_id != NULL)
            $model->stake_id_optional = Cost::getStakeId($model->cost_optional_id)->stake_id;


        $model->time_serv_init = Teachers::getTimestampToDate("d-m-Y", $this_time);
        $model->time_serv_spec_init = Teachers::getTimestampToDate("d-m-Y", $this_time);

        if ($model->timestamp_serv != NULL)
            $model->year_serv = round(($this_time - $model->timestamp_serv) / $year_sec, 2);
        if ($model->timestamp_serv_spec != NULL)
            $model->year_serv_spec = round(($this_time - $model->timestamp_serv_spec) / $year_sec, 2);

        if ($model->load(Yii::$app->request->post()) && Yii::$app->request->isAjax) {
            \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

            return \yii\widgets\ActiveForm::validate($model);
        } elseif ($model->load(Yii::$app->request->post())) {

            //echo '<pre>' . print_r($model, true) . '</pre>';
            if ($model->direction_id_main != NULL and $model->stake_id_main != NULL)
                $model->cost_main_id = Cost::getCostId($model->direction_id_main, $model->stake_id_main)->id;
            if ($model->direction_id_optional != NULL and $model->stake_id_optional != NULL)
                $model->cost_optional_id = Cost::getCostId($model->direction_id_optional, $model->stake_id_optional)->id;

                $model->timestamp_serv = Teachers::getDateToTimestamp("-", $model->time_serv_init) - $model->year_serv * $year_sec;
                $model->timestamp_serv_spec = Teachers::getDateToTimestamp("-", $model->time_serv_spec_init) - $model->year_serv_spec * $year_sec;

            if ($model->save()) {
                Yii::$app->session->setFlash('crudMessage', Yii::t('yee', 'Your item has been updated.'));
                return $this->redirect($this->getRedirectPage('update', $model));
            }
        } else {
            return $this->renderIsAjax('update', compact('model'));
        }
    }

    /**
     *
     *  формируем список ставок для widget DepDrop::classname()
     */
    public function actionStake() {
        $out = [];
        if (isset($_POST['depdrop_parents'])) {
            $parents = $_POST['depdrop_parents'];

            if (!empty($parents)) {
                $direction_id = $parents[0];
                $out = Stake::getStakeByDirectionId($direction_id);

                return json_encode(['output' => $out, 'selected' => '']);
            }
        }
        return json_encode(['output' => '', 'selected' => '']);
    }

}
