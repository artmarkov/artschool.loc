<?php
/**
 * @var $this yii\web\View
 * @var $user yeesoft\models\User
 */
use yii\helpers\Html;

?>
<?php
$link = Yii::$app->urlManager->createAbsoluteUrl(['/auth/default/confirm-email-receive', 'token' => $user->confirmation_token]);
?>

<div class="password-reset">
    <p><?= Yii::t('yee/mail', 'Hello:') ?> <?= Html::encode($user->username) ?>.</p>

    <p><?= Yii::t('yee/mail', 'Follow the link below to confirm your email:') ?></p>

    <p><?= Html::a(Html::encode($link), $link) ?></p>
</div>