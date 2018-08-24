<?php

namespace frontend\controllers;

use Yii;
use frontend\controllers\BaseController;

/**
 * MeasureController implements the CRUD actions for common\models\Measure model.
 */
class MeasureController extends BaseController 
{
    public $modelClass       = 'common\models\Measure';
    public $modelSearchClass = 'common\models\MeasureSearch';

   /* protected function getRedirectPage($action, $model = null)
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
    }*/
}