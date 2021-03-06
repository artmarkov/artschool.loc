<?php

namespace backend\modules\settings\controllers;

use yeesoft\controllers\admin\BaseController;
use yeesoft\helpers\YeeHelper;
use Yii;

/**
 * CacheController implements Flush Cache page.
 *
 * @author Taras Makitra <makitrataras@gmail.com>
 */
class CacheController extends BaseController
{
    public $layout = '@backend/views/layouts/main.php';

    /**
     * @inheritdoc
     */
    public $enableOnlyActions = ['flush'];

    public function actionFlush()
    {
        $frontendAssetPath = Yii::getAlias('@frontend') . '/web/assets/';
        $backendAssetPath = Yii::getAlias('@backend') . '/web/assets/';

        YeeHelper::recursiveDelete($frontendAssetPath);
        YeeHelper::recursiveDelete($backendAssetPath);
        
        if (!is_dir($frontendAssetPath)) {
            @mkdir($frontendAssetPath);
        }
        
        if (!is_dir($backendAssetPath)) {
            @mkdir($backendAssetPath);
        }

        if (Yii::$app->cache->flush()) {
            Yii::$app->session->setFlash('crudMessage', Yii::t('yee', 'Cache has been flushed.'));
        } else {
            Yii::$app->session->setFlash('crudMessage', Yii::t('yee', 'Failed to flush cache.'));
        }

        return Yii::$app->getResponse()->redirect(Yii::$app->getRequest()->referrer);
    }
}