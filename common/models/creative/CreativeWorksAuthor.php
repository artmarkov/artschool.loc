<?php

namespace common\models\creative;

use common\models\user\User;
use Yii;

/**
 * This is the model class for table "{{%creative_works_author}}".
 *
 * @property int $id
 * @property int $works_id
 * @property int $author_id
 * @property int $timestamp_weight Отчетный период надбавки
 * @property int $weight Надбавка
 *
 * @property CreativeWorks $works
 * @property User $author
 */
class CreativeWorksAuthor extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%creative_works_author}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['works_id', 'author_id', 'timestamp_weight'], 'required'],
            [['works_id', 'author_id', 'timestamp_weight', 'weight'], 'integer'],
            [['works_id'], 'exist', 'skipOnError' => true, 'targetClass' => CreativeWorks::className(), 'targetAttribute' => ['works_id' => 'id']],
            [['author_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['author_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/creative', 'ID'),
            'works_id' => Yii::t('yee/creative', 'Works ID'),
            'author_id' => Yii::t('yee/creative', 'Author ID'),
            'timestamp_weight' => Yii::t('yee/creative', 'Timestamp Weight'),
            'weight' => Yii::t('yee/creative', 'Weight'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWorks()
    {
        return $this->hasOne(CreativeWorks::className(), ['id' => 'works_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAuthor()
    {
        return $this->hasOne(User::className(), ['id' => 'author_id']);
    }
}
