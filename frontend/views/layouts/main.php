<?php

use yeesoft\auth\assets\AvatarAsset;
use frontend\assets\AppAsset;
use frontend\assets\ThemeAsset;
use yeesoft\assets\MetisMenuAsset;
use yeesoft\assets\YeeAsset;
use yeesoft\models\Menu;
use yeesoft\widgets\LanguageSelector;
use yeesoft\widgets\Nav as Navigation;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\helpers\Html;
use yii\widgets\Breadcrumbs;
use common\widgets\Alert;
use frontend\widgets\ContactFormWidget;

/* @var $this \yii\web\View */
/* @var $content string */

AppAsset::register($this);
ThemeAsset::register($this);
$assetBundle = YeeAsset::register($this);
MetisMenuAsset::register($this);
AvatarAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<?= (Yii::$app->user->isGuest ? ContactFormWidget::widget([]) : ''); ?>

<div class="wrap">

    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">

        <?php
        $logo = $assetBundle->baseUrl . '/images/yee-logo.png';
        NavBar::begin([
            'brandLabel' => Html::img($logo, ['class' => 'yee-logo', 'alt' => 'YeeCMS']) . '<b>' .Yii::t('yee', 'AIS'). '</b> ' . Yii::$app->settings->get('general.title', 'Yee Site', Yii::$app->language),
            'brandUrl' => Yii::$app->homeUrl,
            'options' => [
                'class' => 'navbar-inverse navbar-static-top',
                'style' => 'margin-bottom: 0'
            ],
            'innerContainerOptions' => [
                'class' => 'container-fluid'
            ]
        ]);

        $menuItems = [
            ['label' => '<i class="fa fa-home"></i>&nbsp;' . Yii::t('yee', 'Home') , 'url' => Yii::$app->urlManager->hostInfo],
        ];
       // $menuItems = Menu::getMenuItems('main-menu');
        if (Yii::$app->user->isGuest){

            $menuItems[] = [
                'label' => '<i class="fa fa-paper-plane-o"></i>&nbsp;' . Yii::t('yee/auth', 'Contact'), 
                'url' => '#', 
                'options' => [
                    'data-toggle' => 'modal', 
                    'data-target' => '#contact-modal'
                    ]
                ];
            $menuItems[] = [
                'label' => '<i class="fa fa-user-plus"></i>&nbsp;' . Yii::t('yee/auth', 'Signup'),
                'url' => \yii\helpers\Url::to(['/auth/default/finding'])
            ];
            $menuItems[] = [
                'label' => '<i class="fa fa-sign-in"></i>&nbsp;' . Yii::t('yee/auth', 'Enter'),
                'url' => \yii\helpers\Url::to(['/auth/default/login'])
            ];
        } else {
            $avatar = ($userAvatar = Yii::$app->user->identity->getAvatar('small')) ? $userAvatar : AvatarAsset::getDefaultAvatar('small');
            $menuItems[] = [
                'label' => '<img src="'.$avatar.'" class="user-image" alt="User Image"/>' . Yii::$app->user->identity->username,
                'url' => ['/auth/default/profile'],
            ];

            $menuItems[] = [
                'label' => '<i class="fa fa-sign-out"></i>&nbsp;' . Yii::t('yee/auth', 'Logout'),
                'url' => ['/auth/default/logout', 'language' => false],
                'linkOptions' => ['data-method' => 'post']
            ];
        }
        echo Nav::widget([
            'encodeLabels' => false,
            'options' => ['class' => 'navbar-nav navbar-right'],
            'items' => $menuItems,
        ]);

        echo LanguageSelector::widget(['display' => 'label', 'view' => 'pills']);

        NavBar::end();
        ?>
<!--<? echo '<pre>' . print_r($menuItems, true) . '</pre>'; ?>-->
<!--<? echo '<pre>' . print_r(Menu::getMenuItems('admin-menu'), true) . '</pre>'; ?>-->
        <!-- SIDEBAR NAV -->
        <div class="navbar-default sidebar metismenu" role="navigation">
            <?php
            $menuItemsKey = Yii::$app->user->isGuest ? '__guestMenuItems' . Yii::$app->language : '__mainMenuItems' . Yii::$app->language;
            if (!$menuItems = Yii::$app->cache->get($menuItemsKey)) {
                $menuItems = Yii::$app->user->isGuest ? Menu::getMenuItems('guest-menu') : Menu::getMenuItems('main-menu');
                Yii::$app->cache->set($menuItemsKey, $menuItems, 3600);
            }
            echo Navigation::widget([
                'encodeLabels' => false,
                'dropDownCaret' => '<span class="arrow"></span>',
                'options' => [
                    ['class' => 'nav side-menu'],
                    ['class' => 'nav nav-second-level'],
                    ['class' => 'nav nav-third-level']
                ],
                'items' => $menuItems,
            ])
            ?>
        </div>
        <!-- !SIDEBAR NAV -->
    </nav>

    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <?= Breadcrumbs::widget(['links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : []]) ?>

                    <?php if (Yii::$app->session->hasFlash('crudMessage')): ?>
                        <div class="alert alert-info alert-dismissible alert-crud" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <?= Yii::$app->session->getFlash('crudMessage') ?>
                        </div>
                    <?php endif; ?>
                    <?= Alert::widget() ?>
                    <?= $content ?>
                </div>
            </div>
        </div>
    </div>

</div>
<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; <?= Html::encode(Yii::$app->settings->get('general.title', 'Yee Site', Yii::$app->language)) ?> 2009-<?= date('Y') ?></p>

        <p class="pull-right"><?= Yii::powered() ?>, <?= yeesoft\Yee::powered() ?></p>
    </div>
</footer>
    
<!--кнопка вверх-->
<?= common\widgets\ScrollupWidget::widget() ?>
<?php $this->endBody() ?>

</body>
</html>
<?php $this->endPage() ?>
