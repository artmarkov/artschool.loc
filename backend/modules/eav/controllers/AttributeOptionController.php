<?php

namespace backend\modules\eav\controllers;


/**
 * AttributeOptionController implements the CRUD actions for yeesoft\eav\models\EavAttributeOption model.
 */
class AttributeOptionController extends \backend\controllers\DefaultController
{
    public $modelClass = 'backend\modules\eav\models\EavAttributeOption';
    public $modelSearchClass = 'backend\modules\eav\models\search\EavAttributeOptionSearch';

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