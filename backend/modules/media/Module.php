<?php

namespace backend\modules\media;
use yeesoft\media\MediaModule;

/**
 * media module definition class
 */
class Module extends MediaModule
{
    /**
     * {@inheritdoc}
     */
    public $controllerNamespace = 'backend\modules\media\controllers';

    /**
     * {@inheritdoc}
     */
    public function init()
    {
        parent::init();

        // custom initialization code goes here
    }
}
