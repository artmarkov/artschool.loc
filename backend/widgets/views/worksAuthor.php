<?php

use yeesoft\widgets\ActiveForm;
use yeesoft\helpers\Html;
use kartik\select2\Select2;

?>
<?php $form = ActiveForm::begin(); ?>

<div class="works-author-widget">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-6">

                            <?=
                            $form->field($model, 'author_id')->widget(Select2::classname(), [

                                'data' => common\models\user\UserCommon::getWorkAuthorTeachersList(),
                                'theme' => Select2::THEME_KRAJEE,
                                'options' => ['placeholder' => Yii::t('yee/user', 'Select teacher...')],
                                'pluginOptions' => [
                                    'allowClear' => true,
                                ],
                                'addon' => [
                                    'append' => [
                                        'content' => Html::a(Yii::t('yee', 'Add'), ['#'], [
                                            'class' => 'btn btn-primary add-to-works-author',
                                           'data-id' => $model->id,
                                        ]),
                                        'asButton' => true,
                                    ],
                                ],
                            ])->label(Yii::t('yee/creative', 'Works authors'));
                            ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">

                            <?php $data = \common\models\creative\CreativeWorksAuthor::getWorksAuthorList($model->id); ?>
<?php if (!empty($data)): ?>
                                <div class="table-responsive">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>№</th>
                                                <th><?= Yii::t('yee', 'Full Name'); ?></th>
                                                <th><?= Yii::t('yee/creative', 'Weight'); ?></th>                                                
                                                <th><?= Yii::t('yee/creative', 'Time weight'); ?></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
    <?php foreach ($data as $id => $item): ?>
                                                <tr>
                                                    <td><?= ++$id ?></td>
                                                    <td><?= $item['author'] ?></td>
                                                    <td><?= $item['weight'] ?></td>
                                                    <td><?= Yii::$app->formatter->asDate($item['timestamp'], 'MMMM Y') ?></td>
                                                    <td><?= Html::a('<span class="glyphicon glyphicon-pencil text-color-default" aria-hidden="true"></span>', ['#'], [
                                                            'class' => 'update-author',
                                                            'data-id' => $item['id'],
                                                        ]);
                                                        ?>
                                                    <?= Html::a('<span class="glyphicon glyphicon-remove text-danger" aria-hidden="true"></span>', ['#'], [
                                                            'class' => 'remove-author',
                                                            'data-id' => $item['id'],
                                                        ]);
                                                        ?>
                                                    </td>
                                                </tr>
    <?php endforeach ?>
                                        </tbody>
                                    </table>
                                </div>
<?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php ActiveForm::end(); ?>

<?php
$js = <<<JS

function showAuthor(author) {
    $('#works-author-modal .modal-body').html(author);
    $('#works-author-modal').modal();
}

$('.add-to-works-author').on('click', function (e) {

    e.preventDefault();
    
    var id = $(this).data('id'),
        author_id = $('#creativeworks-author_id').val();

    $.ajax({
        url: '/admin/creative/works-author/init-author',
        data: {id: id, author_id: author_id},
        type: 'GET',
        success: function (res) {
            if (!res)  alert('Please select teacher...');
           // console.log(res);
           else showAuthor(res);
        },
        error: function () {
            alert('Script Error!');
        }
    });
});

$('.update-author').on('click', function (e) {

    e.preventDefault();

    var id = $(this).data('id');

    $.ajax({
        url: '/admin/creative/works-author/update-author',
        data: {id: id},
        type: 'GET',
        success: function (res) {
            if (!res)  alert('Error!');
           // console.log(res);
           else showAuthor(res);
        },
        error: function () {
            alert('Error!');
        }
    });
});

$('.remove-author').on('click', function (e) {

    e.preventDefault();
    
    var id = $(this).data('id');

    $.ajax({
        url: '/admin/creative/works-author/remove',
        data: {id: id},
        type: 'GET'
    });
});

JS;

$this->registerJs($js);
?>