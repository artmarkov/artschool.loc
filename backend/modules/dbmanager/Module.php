<?php

namespace backend\modules\dbmanager;

/**
 * modules module definition class
 */
class Module extends \bs\dbManager\Module
{
    /**
     * {@inheritdoc}
     */
    public $controllerNamespace = 'backend\modules\dbmanager\controllers';

    /**
     * {@inheritdoc}
     */
    public function init()
    {
        parent::init();

        // custom initialization code goes here
    }
}
