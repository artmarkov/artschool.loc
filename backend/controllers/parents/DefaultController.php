<?php

namespace backend\controllers\parents;

use Yii;
use backend\controllers\DefaultController;

/**
 * DefaultController implements the CRUD actions for common\models\user\UserCommon model.
 */
class DefaultController extends DefaultController 
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
}