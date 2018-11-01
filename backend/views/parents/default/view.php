<?php

use yii\widgets\DetailView;
use yeesoft\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\user\UserCommon */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'User Commons', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-common-view">

    <h3 class="lte-hide-title"><?=  Html::encode($this->title) ?></h3>

    <div class="panel panel-default">
        <div class="panel-body">

            <p>
                <?=                 Html::a('Edit', ['/user-common/default/update', 'id' => $model->id],
                    ['class' => 'btn btn-sm btn-primary'])
                ?>
                <?=                 Html::a('Delete', ['/user-common/default/delete', 'id' => $model->id],
                    [
                    'class' => 'btn btn-sm btn-default',
                    'data' => [
                        'confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                        'method' => 'post',
                    ],
                ])
                ?>
                <?=                 Html::a(Yii::t('yee', 'Add New'), ['/user-common/default/create'],
                    ['class' => 'btn btn-sm btn-primary pull-right'])
                ?>
            </p>


            <?=             DetailView::widget([
                'model' => $model,
                'attributes' => [
            'id',
            'username',
            'auth_key',
            'password_hash',
            'password_reset_token',
            'email:email',
            'status',
            'user_category',
            'created_at',
            'updated_at',
            'superadmin',
            'registration_ip',
            'bind_to_ip',
            'email_confirmed:email',
            'confirmation_token',
            'avatar:ntext',
            'first_name',
            'middle_name',
            'last_name',
            'birth_timestamp:datetime',
            'gender',
            'phone',
            'phone_optional',
            'skype',
            'info',
            'snils',
                ],
            ])
            ?>

        </div>
    </div>

</div>
