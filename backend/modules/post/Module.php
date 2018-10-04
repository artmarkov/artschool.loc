<?php

namespace backend\modules\post;
use yeesoft\post\PostModule;

/**
 * page module definition class
 */
class Module extends PostModule
{
    /**
     * {@inheritdoc}
     */
    public $controllerNamespace = 'backend\modules\post\controllers';

    /**
     * {@inheritdoc}
     */
    public function init()
    {
        parent::init();

        // custom initialization code goes here
    }
}
