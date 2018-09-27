<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'), require(__DIR__ . '/../../common/config/params-local.php'), require(__DIR__ . '/params.php'), require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'frontend',
    'homeUrl' => '/',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'frontend\controllers',
    'modules' => [
        'auth' => [
            'class' => 'yeesoft\auth\AuthModule',
        ],
        'art' => [
            'class' => 'frontend\modules\art\Module',
        ],
    ],
    'components' => [
        'view' => [
            'theme' => [
                'class' => 'frontend\components\Theme',
                'theme' => 'ais_blue', //cerulean, cosmo, default, flatly, readable, simplex, united, ais_blue, ais_default
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
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => array(
                '<module:auth>/<action:(logout|captcha|signup|finding)>' => '<module>/default/<action>',
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
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
    ],
    'params' => $params,
];
