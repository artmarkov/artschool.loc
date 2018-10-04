<?php

namespace backend\modules\eav;
use yeesoft\eav\EavModule;

/**
 * eav module definition class
 */
class Module extends EavModule
{
    /**
     * {@inheritdoc}
     */
    public $controllerNamespace = 'backend\modules\eav\controllers';

    /**
     * {@inheritdoc}
     */
    public function init()
    {
        parent::init();

        // custom initialization code goes here
    }
}
