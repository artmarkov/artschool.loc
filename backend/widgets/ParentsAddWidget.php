<?php

namespace backend\widgets;

use Yii;
use yii\base\Widget;
use common\models\user\UserCommon;

class ParentsAddWidget extends Widget {

    public function run() {
        
        $id = Yii::$app->request->get('id');
        $model_st = \common\models\student\Student::findOne(['id' => $id]);
        $model = UserCommon::findOne(['id' => $model_st->user_id]);
//       echo '<pre>' . print_r($model, true) . '</pre>';
//        $model = new UserCommon();

        return $this->render('parentsAdd', [
                    'model' => $model,
        ]);
    }

}
