<?php

namespace backend\controllers\teachers;

use common\models\teachers\DirectionCost;
use common\models\teachers\Teachers;
use Yii;


/**
 * DefaultController implements the CRUD actions for common\models\teachers\Teachers model.
 */
class DefaultController extends \backend\controllers\DefaultController
{
    public $modelClass       = 'common\models\teachers\Teachers';
    public $modelSearchClass = 'common\models\teachers\search\TeachersSearch';

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

    /*public function actionUpdate($id)
    {
        $teachers = Teachers::findOne($id);
        $directionCost = DirectionCost::findOne($id);

        if (!isset($teachers, $directionCost)) {
            throw new NotFoundHttpException("The user was not found.");
        }

//        $teachers->scenario = 'update';
//        $directionCost->scenario = 'update';

        if ($teachers->load(Yii::$app->request->post()) && $directionCost->load(Yii::$app->request->post())) {
            $isValid = $teachers->validate();
            $isValid = $directionCost->validate() && $isValid;
            if ($isValid) {
                $teachers->save(false);
                $directionCost->save(false);
                return $this->redirect(['view', 'id' => $id]);
            }
        }

        return $this->render('update', [
            'teachers' => $teachers,
            'directionCost' => $directionCost,
        ]);
    }*/
}