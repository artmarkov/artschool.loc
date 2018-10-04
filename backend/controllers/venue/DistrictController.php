<?php

namespace backend\controllers\venue;

use Yii;
use yeesoft\controllers\admin\BaseController;

/**
 * DistrictController implements the CRUD actions for common\models\venue\VenueDistrict model.
 */
class DistrictController extends BaseController 
{
    public $modelClass       = 'common\models\venue\VenueDistrict';
    public $modelSearchClass = 'common\models\venue\search\VenueDistrictSearch';

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