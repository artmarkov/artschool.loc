<?php

namespace backend\controllers\creative;

use Yii;
use backend\controllers\DefaultController;

/**
 * WorksAuthorController implements the CRUD actions for common\models\creative\CreativeWorksAuthor model.
 */
class WorksAuthorController extends DefaultController 
{
    public $modelClass       = 'common\models\creative\CreativeWorksAuthor';
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