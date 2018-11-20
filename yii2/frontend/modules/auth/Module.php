<?php

namespace frontend\modules\auth;
use yeesoft\auth\AuthModule;

/**
 * art module definition class
 */
class Module extends AuthModule
{
    /**
     * {@inheritdoc}
     */
    public $controllerNamespace = 'frontend\modules\auth\controllers';

    /**
     * {@inheritdoc}
     */
    public function init()
    {
        parent::init();

        // custom initialization code goes here
    }
}
