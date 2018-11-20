<?php

namespace frontend\controllers;

use Yii;
use frontend\controllers\BaseController;

/**
 * OptionController implements the CRUD actions for common\models\Option model.
 */
class OptionController extends BaseController 
{
    public $modelClass       = 'common\models\Option';
    public $modelSearchClass = 'common\models\OptionSearch';

    protected function getRedirectPage($action, $model = null)
    {
        switch ($action) {
            case 'update':
                return ['update', 'id' => $model->id];
                break;
            case 'create':
               // $model->addCustomLog('hello world!', 'hello_type');
                return ['update', 'id' => $model->id];
                break;
            default:
                return parent::getRedirectPage($action, $model);
        }
    }
}