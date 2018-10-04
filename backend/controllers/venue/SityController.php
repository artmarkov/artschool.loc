<?php

namespace backend\controllers\venue;

use Yii;
use yeesoft\controllers\admin\BaseController;

/**
 * SityController implements the CRUD actions for common\models\venue\VenueSity model.
 */
class SityController extends BaseController 
{
    public $modelClass       = 'common\models\venue\VenueSity';
    public $modelSearchClass = 'common\models\venue\search\VenueSitySearch';

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