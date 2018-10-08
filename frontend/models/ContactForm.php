<?php

namespace frontend\models;

use Yii;
use yii\base\Model;
use himiklab\yii2\recaptcha\ReCaptchaValidator;

/**
 * ContactForm is the model behind the contact form.
 */
class ContactForm extends Model
{
    public $name;
    public $email;
    public $subject;
    public $body;
//    public $verifyCode;
    public $reCaptcha;


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // name, email, subject and body are required
            [['name', 'email', 'subject', 'body'], 'required'],
            // email has to be a valid email address
            ['email', 'email'],
            // verifyCode needs to be entered correctly
//            ['verifyCode', 'captcha'],
            [
                ['reCaptcha'], ReCaptchaValidator::className(),
                'secret' => '6Lf6gV4UAAAAANvOPDtx_2obe-hxVKnbeDjUCcfI',
                'uncheckedMessage' => \Yii::t('app', 'Please confirm that you are not a bot.')
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'name' => \Yii::t('app', 'Name'),
            'email' => \Yii::t('app', 'Email'),
            'subject' => \Yii::t('app', 'Subject'),
            'body' => \Yii::t('app', 'Body'),
//            'verifyCode' => 'Verification Code',
            'reCaptcha' => \Yii::t('app', 'reCaptcha'),
        ];
    }

    /**
     * Sends an email to the specified email address using the information collected by this model.
     *
     * @param string $email the target email address
     * @return bool whether the email was sent
     */
    public function sendEmail($email)
    {
        return Yii::$app->mailer->compose()
            ->setTo($email)
            ->setFrom([$this->email => $this->name])
            ->setSubject($this->subject)
            ->setTextBody($this->body)
            ->send();
    }
}
