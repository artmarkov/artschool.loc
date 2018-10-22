<?php

namespace backend\controllers\subject;

use Yii;

/**
 * DefaultController implements the CRUD actions for common\models\subject\Subject model.
 */
class DefaultController extends \backend\controllers\DefaultController
{
    public $modelClass       = 'common\models\subject\Subject';
    public $modelSearchClass = 'common\models\subject\search\SubjectSearch';

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
}