<?php

namespace backend\modules\page;
use yeesoft\page\PageModule;

/**
 * page module definition class
 */
class Module extends PageModule
{
    /**
     * {@inheritdoc}
     */
    public $controllerNamespace = 'backend\modules\page\controllers';

    /**
     * {@inheritdoc}
     */
    public function init()
    {
        parent::init();

        // custom initialization code goes here
    }
}
