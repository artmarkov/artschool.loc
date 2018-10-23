<?php

namespace common\models\subject;

use Yii;

/**
 * This is the model class for table "{{%subject_vid}}".
 *
 * @property int $id
 * @property string $name
 * @property string $slug
 * @property int $qty_min
 * @property int $qty_max
 * @property string $info
 * @property int $status
 */
class SubjectVid extends \yii\db\ActiveRecord
{
    const STATUS_ACTIVE = 1;
    const STATUS_INACTIVE = 0;
    
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%subject_vid}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'slug', 'qty_min', 'qty_max', 'status'], 'required'],
            [['qty_min', 'qty_max', 'status'], 'integer'],
            [['info'], 'string'],
            [['name'], 'string', 'max' => 64],
            [['slug'], 'string', 'max' => 32],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/guide', 'ID'),
            'name' => Yii::t('yee/guide', 'Name'),
            'slug' => Yii::t('yee/guide', 'Slug'),
            'qty_min' => Yii::t('yee/guide', 'Qty Min'),
            'qty_max' => Yii::t('yee/guide', 'Qty Max'),
            'info' => Yii::t('yee/guide', 'Info'),
            'status' => Yii::t('yee/guide', 'Status'),
        ];
    }
    
    /**
     * getStatusList
     * @return array
     */
    public static function getStatusList() {
        return array(
            self::STATUS_ACTIVE => Yii::t('yee', 'Active'),
            self::STATUS_INACTIVE => Yii::t('yee', 'Inactive'),
        );
    }
    /**
     * getStatusValue
     *
     * @param string $val
     *
     * @return string
     */
    public static function getStatusValue($val) {
        $ar = self::getStatusList();

        return isset($ar[$val]) ? $ar[$val] : $val;
    }
}

