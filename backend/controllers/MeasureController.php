<?php

namespace backend\controllers;

use Yii;
use yeesoft\controllers\admin\BaseController;

/**
 * MeasureController implements the CRUD actions for backend\models\Measure model.
 */
class MeasureController extends BaseController
{
    public $modelClass       = 'backend\models\Measure';
    public $modelSearchClass = 'backend\models\MeasureSearch';
/*
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
    }*/
}
