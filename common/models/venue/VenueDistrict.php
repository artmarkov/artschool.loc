<?php

namespace common\models\venue;

use Yii;

/**
 * This is the model class for table "{{%venue_district}}".
 *
 * @property int $id
 * @property int $sity_id
 * @property string $name
 * @property string $slug
 *
 * @property VenueSity $sity
 * @property VenuePlace[] $venuePlaces
 */
class VenueDistrict extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%venue_district}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['sity_id', 'name', 'slug'], 'required'],
            [['sity_id'], 'integer'],
            [['name'], 'string', 'max' => 255],
            [['slug'], 'string', 'max' => 16],
            [['sity_id'], 'exist', 'skipOnError' => true, 'targetClass' => VenueSity::className(), 'targetAttribute' => ['sity_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/venue', 'ID'),
            'sity_id' => Yii::t('yee/venue', 'Sity ID'),
            'name' => Yii::t('yee/venue', 'Name'),
            'slug' => Yii::t('yee/venue', 'Slug'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSity()
    {
        return $this->hasOne(VenueSity::className(), ['id' => 'sity_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getVenuePlaces()
    {
        return $this->hasMany(VenuePlace::className(), ['district_id' => 'id']);
    }
}
