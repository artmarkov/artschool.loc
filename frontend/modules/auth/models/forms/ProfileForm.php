<?php
/**
 * Created by PhpStorm.
 * User: Zver
 * Date: 13.09.2018
 * Time: 12:16
 */

namespace frontend\modules\auth\models\forms;

use Yii;

use common\models\auth\User;

class ProfileForm extends User
{

    public function rules()
    {
        return [
            [['username', 'email'], 'required'],
            [['first_name', 'last_name'], 'required'],
            [['first_name', 'middle_name', 'last_name', 'email'], 'trim'],
            ['email', 'email'],
            [['first_name', 'middle_name', 'last_name'], 'match', 'pattern' => Yii::$app->yee->cyrillicRegexp, 'message' => Yii::t('yee', 'Only need to enter Russian letters')],
            ['phone', 'required'],
            ['birth_date', 'required'],
            ['birth_date','validateDateCorrect'],
        ];
    }

    public function afterSave($insert, $changedAttributes)
    {
        parent::afterSave($insert, $changedAttributes);

        if (isset($changedAttributes['email'])) {
            if (Yii::$app->yee->emailConfirmationRequired) {
                $this->getCurrentUser();
                $this->generateConfirmationToken();
                $this->email_confirmed = 0;
                $this->status = User::STATUS_INACTIVE;
//                 echo '<pre>' . print_r($this, true) . '</pre>';

                if (!$this->save()) {
                    $this->addError('username', Yii::t('yee/auth', 'Login has been taken'));
                } else {
                    if (!$this->sendConfirmationEmail($this)) {
                        $this->addError('email', Yii::t('yee/auth', 'Could not send confirmation email'));
                    } else {
                        Yii::$app->session->setFlash('success', Yii::t('yee/auth', 'Check your e-mail {email} for further instructions', ['email' => '<b>' . $this->email . '</b>']));
                    }
                }
            }
        } else {
            Yii::$app->session->setFlash('success', Yii::t('yee', 'Your item has been updated.'));
        }
    }

    protected function sendConfirmationEmail($user)
    {
        return Yii::$app->mailer->compose(Yii::$app->yee->emailTemplates['profile-email-confirmation'], ['user' => $user])
            ->setFrom(Yii::$app->yee->emailSender)
            ->setTo($user->email)
            ->setSubject(Yii::t('yee/auth', 'E-mail confirmation for') . ' ' . Yii::$app->name)
            ->send();
    }
}