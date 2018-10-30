<?php

namespace frontend\widgets;

use Yii;
use yii\base\Widget;
use frontend\models\ContactForm;

class ContactFormWidget extends Widget {

    public function run() {
        if (Yii::$app->user->isGuest) {
            $model = new ContactForm();
            return $this->render('contactFormWidget', [
                        'model' => $model,
            ]);
        } else {
            return;
        }
    }
}
