<?php

namespace backend\controllers\teachers;

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
}