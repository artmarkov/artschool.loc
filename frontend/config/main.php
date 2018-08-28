<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'), require(__DIR__ . '/../../common/config/params-local.php'), require(__DIR__ . '/params.php'), require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'frontend',
    'homeUrl' => '/',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'controllerNamespace' => 'frontend\controllers',
    'modules' => [
        'auth' => [
            'class' => 'yeesoft\auth\AuthModule',
        ],
    ],
    'components' => [
        'view' => [
            'theme' => [
                'class' => 'frontend\components\Theme',
                'theme' => 'default', //cerulean, cosmo, default, flatly, readable, simplex, united
            ],
            'as seo' => [
                'class' => 'yeesoft\seo\components\SeoViewBehavior',
            ]
        ],
        'seo' => [
            'class' => 'yeesoft\seo\components\Seo',
        ],
        'request' => [
            'baseUrl' => '',
        ],
        'urlManager' => [
            'class' => 'yeesoft\web\MultilingualUrlManager',
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'suffix' => '.htm',
            'rules' => array(
                '<module:auth>/<action:(logout|captcha)>' => '<module>/default/<action>',
                '<module:auth>/<action:(oauth)>/<authclient:\w+>' => '<module>/default/<action>',
            ),
            'multilingualRules' => [
                '<controller:(measure|option)>' => '<controller>/index',
                '<controller:(measure|option)>/<id:\d+>' => '<controller>/view',
                '<controller:(measure|option)>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
                '<controller:(measure|option)>/<action:\w+>' => '<controller>/<action>',

                '<module:auth>/<action:\w+>' => '<module>/default/<action>',
                '<controller:(category|tag)>/<slug:[\w \-]+>' => '<controller>/index',
                '<controller:(category|tag)>' => '<controller>/index',
                '<slug:[\w \-]+>' => 'site/index/',
                '/' => 'site/index',
                '<action:[\w \-]+>' => 'site/<action>',
                '<controller:\w+>/<action:\w+>' => '<controller>/<action>',
            ],
            'nonMultilingualUrls' => [
                'auth/default/oauth',
            ],
        ],
        'authClientCollection' => [
            'class' => 'yii\authclient\Collection',
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
    ],
    'params' => $params,
];
