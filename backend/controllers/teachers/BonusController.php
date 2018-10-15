<?php

namespace backend\controllers\teachers;

use Yii;
use backend\controllers\DefaultController;

/**
 * BonusController implements the CRUD actions for common\models\teachers\Bonus model.
 */
class BonusController extends DefaultController 
{
    public $modelClass       = 'common\models\teachers\Bonus';
    public $modelSearchClass = 'common\models\teachers\search\BonusSearch';

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