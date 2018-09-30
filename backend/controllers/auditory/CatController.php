<?php

namespace backend\controllers\auditory;

use Yii;
use yeesoft\controllers\admin\BaseController;

/**
 * AuditoryCatController implements the CRUD actions for common\models\AuditoryCat model.
 */
class CatController extends BaseController 
{
    public $modelClass       = 'common\models\auditory\AuditoryCat';
    public $modelSearchClass = 'common\models\auditory\search\AuditoryCatSearch';

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