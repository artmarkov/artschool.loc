<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'backend',
    'homeUrl' => '/admin',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'modules' => [
        'db-manager' => [
            'class' => 'backend\modules\dbmanager\Module',
            // path to directory for the dumps
            'path' => '@frontend/web/backups',
            // list of registerd db-components
            'dbList' => ['db'],
            /* 'as access' => [
                 'class' => 'yii\filters\AccessControl',
                 'rules' => [
                     [
                         'allow' => true,
                         'roles' => ['admin'],
                     ],
                 ],
             ],*/
        ],
        'settings' => [
            'class' => 'backend\modules\settings\Module',
        ],
        'menu' => [
            'class' => 'backend\modules\menu\Module',
        ],
        'translation' => [
            'class' => 'backend\modules\translation\Module',
        ],
       'user' => [
            'class' => 'backend\modules\user\Module',
        ],
        'media' => [
            'class' => 'backend\modules\media\Module',
            'routes' => [
                'baseUrl' => '', // Base absolute path to web directory
                'basePath' => '@frontend/web', // Base web directory url
                'uploadPath' => 'uploads', // Path for uploaded files in web directory
            ],
        ],
        'post' => [
            'class' => 'backend\modules\post\Module',
        ],
       'page' => [
            'class' => 'backend\modules\page\Module',
        ],
        'seo' => [
            'class' => 'backend\modules\seo\Module',
        ],
        'comment' => [
            'class' => 'backend\modules\comment\Module',
        ],
        'eav' => [
            'class' => 'backend\modules\eav\Module',
        ],
    ],
    'components' => [
        'request' => [
            'baseUrl' => '/admin',
        ],
        'assetManager' => [
            'bundles' => [
                'yii\bootstrap\BootstrapAsset' => [
                    'sourcePath' => '@yeesoft/yii2-yee-core/assets/theme/bootswatch/custom',
                    'css' => ['bootstrap.css']
                ],
            ],
        ],
        'urlManager' => [
            'class' => 'yeesoft\web\MultilingualUrlManager',
            'showScriptName' => false,
            'enablePrettyUrl' => true,
            'multilingualRules' => false,
            'rules' => array(
                //add here local frontend controllers
                '<controller:(db)>' => '<controller>/index',
                '<controller:(db)>/<action>' => '<controller>/<action>',
                '<controller:(measure)>' => '<controller>/index',
                '<controller:(measure)>/<id:\d+>' => '<controller>/view',
                '<controller:(measure)>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
                '<controller:(measure)>/<action:\w+>' => '<controller>/<action>',
                //yee cms and other modules routes
                '<module:\w+>/' => '<module>/default/index',
                '<module:\w+>/<action:\w+>/<id:\d+>' => '<module>/default/<action>',
                '<module:\w+>/<action:(create)>' => '<module>/default/<action>',
                '<module:\w+>/<controller:\w+>' => '<module>/<controller>/index',
                '<module:\w+>/<controller:\w+>/<action:\w+>/<id:\d+>' => '<module>/<controller>/<action>',
                '<module:\w+>/<controller:\w+>/<action:\w+>' => '<module>/<controller>/<action>',
            )
        ],

        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
    ],
    'params' => $params,
];
