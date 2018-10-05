<?php

namespace backend\controllers\venue;

use Yii;

/**
 * DefaultController implements the CRUD actions for common\models\venue\VenuePlace model.
 */
class DefaultController extends \backend\controllers\DefaultController
{
    public $modelClass       = 'common\models\venue\VenuePlace';
    public $modelSearchClass = 'common\models\venue\search\VenuePlaceSearch';

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