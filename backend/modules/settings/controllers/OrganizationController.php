<?php

namespace backend\modules\settings\controllers;

/**
 * ReadingController implements Reading Settings page.
 *
 * @author Taras Makitra <makitrataras@gmail.com>
 */
class OrganizationController extends SettingsBaseController
{
    public $modelClass = 'backend\modules\settings\models\OrganizationSettings';
    public $viewPath = '@backend/modules/settings/views/organization/index';

}