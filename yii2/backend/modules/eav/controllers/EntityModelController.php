<?php

namespace backend\modules\eav\controllers;


/**
 * EavEntityModelController implements the CRUD actions for yeesoft\eav\models\EavEntityModel model.
 */
class EntityModelController extends \backend\controllers\DefaultController
{
    public $modelClass = 'backend\modules\eav\models\EavEntityModel';
    public $modelSearchClass = 'backend\modules\eav\models\search\EavEntityModelSearch';

    public $disabledActions = ['view', 'bulk-activate', 'bulk-deactivate'];

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