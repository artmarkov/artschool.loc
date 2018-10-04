<?php

namespace frontend\modules\auth\models\forms;

use common\models\auth\User;

use Yii;
use yii\base\Model;

class ResetPasswordForm extends Model
{
    /**
     * @var User
     */
    protected $user;

    /**
     * @var string
     */

    public $username;
    /**
     * @var string
     */
    public $email;

    /**
     * @var string
     */
    public $captcha;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['captcha', 'captcha', 'captchaAction' => '/auth/default/captcha'],
            [['email', 'username', 'captcha'], 'required'],
            [['email', 'username'], 'trim'],
            ['email', 'email'],
            ['email', 'validateEmailConfirmedAndUserActive'],
        ];
    }

    /**
     * @return bool
     */
    public function validateEmailConfirmedAndUserActive()
    {
        if (!Yii::$app->yee->checkAttempts()) {
            $this->addError('email', Yii::t('yee/auth', 'Too many attempts'));
            return false;
        }

        $user = User::findOne([
            'username' => $this->username,
            'email' => $this->email,
            'email_confirmed' => 1,
            'status' => User::STATUS_ACTIVE,
        ]);

        if ($user) {
            $this->user = $user;
        } else {
            $this->addError('email', Yii::t('yee/auth', 'A Login and E-mail not found.'));
        }
    }

    /**
     * @return array
     */
    public function attributeLabels()
    {
        return [
            'email' => 'E-mail',
            'username' => Yii::t('yee/auth', 'Login'),
            'captcha' => Yii::t('yee/auth', 'Captcha'),
        ];
    }

    /**
     * @param bool $performValidation
     *
     * @return bool
     */
    public function sendEmail($performValidation = true)
    {
        if ($performValidation AND !$this->validate()) {
            return false;
        }

        $this->user->generateConfirmationToken();
        $this->user->save(false);

        return Yii::$app->mailer->compose(Yii::$app->yee->emailTemplates['password-reset'],
            ['user' => $this->user])
            ->setFrom(Yii::$app->yee->emailSender)
            ->setTo($this->email)
            ->setSubject(Yii::t('yee/auth', 'Password reset for') . ' ' . Yii::$app->name)
            ->send();
    }
}