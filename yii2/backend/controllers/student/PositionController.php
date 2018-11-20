<?php

namespace backend\controllers\student;

use Yii;
use yeesoft\controllers\admin\BaseController;

/**
 * PositionController implements the CRUD actions for common\models\student\StudentPosition model.
 */
class PositionController extends BaseController 
{
    public $modelClass       = 'common\models\student\StudentPosition';
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