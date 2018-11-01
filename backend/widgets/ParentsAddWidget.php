<?php

namespace backend\widgets;

use Yii;
use yii\base\Widget;
use common\models\user\UserCommon;

class ParentsAddWidget extends Widget {

    public function run() {

        $model = new UserCommon();

        return $this->render('parentsAdd', [
                    'model' => $model,
        ]);
    }

}
