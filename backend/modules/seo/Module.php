<?php

namespace backend\modules\seo;
use yeesoft\seo\SeoModule;

/**
 * seo module definition class
 */
class Module extends SeoModule
{
    /**
     * {@inheritdoc}
     */
    public $controllerNamespace = 'backend\modules\seo\controllers';

    /**
     * {@inheritdoc}
     */
    public function init()
    {
        parent::init();

        // custom initialization code goes here
    }
}
