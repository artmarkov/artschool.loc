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
    
    public static function getWorksAuthorList($works_id)
    {
        $data = CreativeWorksAuthor::find()            
            ->innerJoin('user', 'user.id = creative_works_author.author_id')
            ->andWhere(['in', 'creative_works_author.works_id' , $works_id])
            ->select(['user.id as user_id',
                      'creative_works_author.id as id',
                      "CONCAT(user.last_name, ' ',user.first_name, ' ',user.middle_name) AS author",
                      'creative_works_author.weight as weight',
                      'creative_works_author.timestamp_weight as timestamp'                      
                ])
            ->orderBy('user.last_name')
            ->asArray()->all(); 

      return $data; 
    }
}
