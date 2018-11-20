<?php

namespace backend\modules\eav\controllers;

/**
 * AttributeTypeController implements the CRUD actions for yeesoft\eav\models\EavAttributeType model.
 */
class AttributeTypeController extends \backend\controllers\DefaultController
{
    public $modelClass = 'backend\modules\eav\models\EavAttributeType';
    public $modelSearchClass = 'backend\modules\eav\models\search\EavAttributeTypeSearch';

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