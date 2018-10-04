<?php

namespace frontend\modules\auth\controllers;

use frontend\modules\auth\models\forms\FindingForm;
use frontend\modules\auth\models\forms\ProfileForm;
use frontend\modules\auth\models\forms\ResetPasswordForm;
use frontend\modules\auth\models\forms\UpdatePasswordForm;
use frontend\modules\auth\models\forms\SignupForm;
use common\models\auth\User;
use yeesoft\components\AuthEvent;
use Yii;
use yii\web\NotFoundHttpException;
use common\widgets\ActiveForm;
/**
 * Default controller for the `art` module
 */
class DefaultController extends \yeesoft\auth\controllers\DefaultController
{
    /**
     * @var array
     */
    public $freeAccessActions = ['login', 'logout', 'captcha', 'oauth', 'signup','finding',
        'confirm-email', 'confirm-registration-email', 'confirm-email-receive',
        'reset-password', 'reset-password-request', 'update-password', 'set-email',
        'set-username', 'set-password', 'profile', 'upload-avatar', 'remove-avatar',
        'unlink-oauth'];

    /**
     * Finding page before registration
     *
     * @return string
     */

    public function actionFinding()
    {
        if (!Yii::$app->user->isGuest) {
            throw new NotFoundHttpException(Yii::t('yee', 'Page not found.'));
        }
        $model = new FindingForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $d_in = explode("-", $model->birth_date);
            $model->birth_timestamp = mktime(0, 0, 0, $d_in[1], $d_in[0], $d_in[2]);
            $user = FindingForm::findByFio(
                $model->last_name,
                $model->first_name,
                $model->middle_name,
                $model->birth_timestamp,
                User::STATUS_INACTIVE
            );
            if ($user) {
                return $this->redirect(['signup', 'auth_key' => $user->auth_key]);
            } else {
                Yii::$app->session->setFlash('error', Yii::t('yee/auth', "User not found or blocked in the system."));
            }
        }
        return $this->render('finding', compact('model'));
    }

    /**
     * Signup page after finding user params
     *
     * @return string
     */

    public function actionSignup($auth_key)
    {
        if (!Yii::$app->user->isGuest) {
            throw new NotFoundHttpException(Yii::t('yee', 'Page not found.'));
        }
        $user = User::findByAuthKey($auth_key);
        if (!$user) {
            Yii::$app->session->setFlash('error', Yii::t('yee/auth', "Token not found. It may be expired"));
            return $this->goHome();
        }
        $model = new SignupForm();

        if (empty($user->username)) {
            $username = FindingForm::generateUsername($user->last_name, $user->first_name, $user->middle_name);
        } else {
            $username = $user->username;
        }
        $model->setAttributes(
            [
                'username' => $username,
                'id' => $user->id,
            ]
        );
        if (Yii::$app->request->isAjax AND $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return $model->validate();
        }

        if ($model->load(Yii::$app->request->post()) AND $model->validate()) {
            // Trigger event "before registration" and checks if it's valid
            if ($this->triggerModuleEvent(AuthEvent::BEFORE_REGISTRATION, ['model' => $model])) {

                $user = $model->signup(false,$model);

                // Trigger event "after registration" and checks if it's valid
                if ($user && $this->triggerModuleEvent(AuthEvent::AFTER_REGISTRATION, ['model' => $model, 'user' => $user])) {

                    if (Yii::$app->yee->emailConfirmationRequired) {
                        Yii::$app->session->setFlash('info', Yii::t('yee/auth', 'Check your e-mail {email} for instructions to activate account', ['email' => '<b>' . $user->email . '</b>']));
                        //return $this->renderIsAjax('signup-confirmation', compact('user'));
                    } else {
                        $user->assignRoles(Yii::$app->yee->defaultRoles);

                        Yii::$app->user->login($user);

                        return $this->redirect(Yii::$app->user->returnUrl);
                    }
                }
            }
        }

        return $this->renderIsAjax('signup', compact('model'));
    }
    /**
     * @return string|\yii\web\Response
     */
    public function actionProfile()
    {
        if ($this->module->profileLayout) {
            $this->layout = $this->module->profileLayout;
        }

        if (Yii::$app->user->isGuest) {
            throw new NotFoundHttpException(Yii::t('yii', 'Page not found.'));
        }

        $model = ProfileForm::findIdentity(Yii::$app->user->id);

        if($model->birth_timestamp != NULL) $model->getTimestampToDate($mask = "d-m-Y");

        if ($model->load(Yii::$app->request->post())) {

            $model->getDateToTimestamp("-");

            $model->save();
        }

        return $this->renderIsAjax('profile', compact('model'));
    }
    /**
     * Receive token after registration, find user by it and confirm email
     *
     * @param string $token
     *
     * @throws \yii\web\NotFoundHttpException
     * @return string|\yii\web\Response
     */
    public function actionConfirmRegistrationEmail($token)
    {
        if (Yii::$app->yee->emailConfirmationRequired) {

            $model = new SignupForm();
            $user = $model->checkConfirmationToken($token);

            if ($user) {
                return $this->renderIsAjax('confirm-email-success', compact('user'));
            }

            throw new NotFoundHttpException(Yii::t('yee/auth', 'Token not found. It may be expired'));
        }
    }

    /**
     * Change your own password
     *
     * @throws \yii\web\ForbiddenHttpException
     * @return string|\yii\web\Response
     */
    public function actionUpdatePassword()
    {
        if (Yii::$app->user->isGuest) {
            throw new NotFoundHttpException(Yii::t('yii', 'Page not found.'));
        }

        $user = User::getCurrentUser();

        if ($user->status != User::STATUS_ACTIVE) {
            throw new ForbiddenHttpException();
        }

        $model = new UpdatePasswordForm(compact('user'));

        if (Yii::$app->request->isAjax AND $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ActiveForm::validate($model);
        }

        if ($model->load(Yii::$app->request->post()) AND $model->updatePassword(false)) {
            Yii::$app->user->logout();
            return $this->renderIsAjax('update-password-success');
        }

        return $this->renderIsAjax('update-password', compact('model'));
    }

    /**
     * Action to reset password
     *
     * @return string|\yii\web\Response
     */
    public function actionResetPassword()
    {
        if (!Yii::$app->user->isGuest) {
            throw new NotFoundHttpException(Yii::t('yii', 'Page not found.'));
        }

        $model = new ResetPasswordForm();

        if (Yii::$app->request->isAjax AND $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return $model->validate();
        }

        if ($model->load(Yii::$app->request->post()) AND $model->validate()) {
            if ($this->triggerModuleEvent(AuthEvent::BEFORE_PASSWORD_RECOVERY_REQUEST, ['model' => $model])) {
                if ($model->sendEmail(false)) {
                    if ($this->triggerModuleEvent(AuthEvent::AFTER_PASSWORD_RECOVERY_REQUEST, ['model' => $model])) {
                        return $this->renderIsAjax('reset-password-success');
                    }
                } else {
                    Yii::$app->session->setFlash('error', Yii::t('yee/auth', "Unable to send message for email provided"));
                }
            }
        }

        return $this->renderIsAjax('reset-password', compact('model'));
    }
    /**
     * Receive token, find user by it and show form to change password
     *
     * @param string $token
     *
     * @throws \yii\web\NotFoundHttpException
     * @return string|\yii\web\Response
     */
    public function actionResetPasswordRequest($token)
    {
        if (!Yii::$app->user->isGuest) {
            throw new NotFoundHttpException(Yii::t('yii', 'Page not found.'));
        }

        $user = User::findByConfirmationToken($token);

        if (!$user) {
            throw new NotFoundHttpException(Yii::t('yee/auth', 'Token not found. It may be expired. Try reset password once more'));
        }

        $model = new UpdatePasswordForm([
            'scenario' => 'restoreViaEmail',
            'user' => $user,
        ]);

        if ($model->load(Yii::$app->request->post()) AND $model->validate()) {
            if ($this->triggerModuleEvent(AuthEvent::BEFORE_PASSWORD_RECOVERY_COMPLETE, ['model' => $model])) {
                $model->updatePassword(false);
                if ($this->triggerModuleEvent(AuthEvent::AFTER_PASSWORD_RECOVERY_COMPLETE, ['model' => $model])) {
                    return $this->renderIsAjax('update-password-success');
                }
            }
        }

        return $this->renderIsAjax('update-password', compact('model'));
    }
    /**
     * Receive token, find user by it and confirm email
     *
     * @param string $token
     *
     * @throws \yii\web\NotFoundHttpException
     * @return string|\yii\web\Response
     */
    public function actionConfirmEmailReceive($token)
    {
        $user = User::findByConfirmationToken($token);

        if (!$user) {
            throw new NotFoundHttpException(Yii::t('yii', 'Page not found.'));
        }

        $user->email_confirmed = 1;
        $user->removeConfirmationToken();
        $user->save();

        return $this->renderIsAjax('confirm-email-success', compact('user'));
    }

}
