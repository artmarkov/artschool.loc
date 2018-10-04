<?php
namespace common\components;

class Yee extends \yeesoft\Yee
{
    /**
     * Pattern that will be applied for user names on users form in RUSS
     *
     * @var string
     */
    public $cyrillicRegexp = '/^[а-яёА-ЯЁ]+$/iu';
    /**
     * List of languages used in application.
     *
     * @var array
     */
    public $languages = ['ru' => 'Россия'];

    /**
     * List of language slug redirects. You can use this parameter to redirect
     * language slug to another slug. For example `en-US` to `en`.
     *
     * @var array
     */
    public $languageRedirects = ['ru' => 'ru'];
    /**
     * Default email templates.
     *
     * @var array
     */
    protected $_defaultEmailTemplates = [
        'signup-confirmation' => '/mail/signup-email-confirmation-html',
        'profile-email-confirmation' => '/mail/profile-email-confirmation-html',
        'password-reset' => '/mail/password-reset-html',
        'confirm-email' => '/mail/email-confirmation-html',
    ];
}