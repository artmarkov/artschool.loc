<?php

namespace common\models\venue;

use Yii;
use yeesoft\models\User;
/**
 * This is the model class for table "{{%venue_place}}".
 *
 * @property int $id
 * @property int $country_id
 * @property int $sity_id
 * @property int $district_id
 * @property string $name
 * @property string $address
 * @property string $phone
 * @property string $phone_optional
 * @property string $email
 * @property string $сontact_person
 * @property double $latitude
 * @property double $longitude
 * @property string $description
 * @property int $created_at
 * @property int $updated_at
 * @property int $created_by
 * @property int $updated_by
 *
 * @property VenueCountry $country
 * @property VenueDistrict $district
 * @property VenueSity $sity
 * @property User $createdBy
 * @property User $updatedBy
 */
class VenuePlace extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%venue_place}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['country_id', 'sity_id', 'district_id', 'name', 'address', 'phone', 'phone_optional', 'email', 'сontact_person'], 'required'],
            [['country_id', 'sity_id', 'district_id', 'created_at', 'updated_at', 'created_by', 'updated_by'], 'integer'],
            [['latitude', 'longitude'], 'number'],
            [['name', 'сontact_person'], 'string', 'max' => 127],
            [['address', 'email', 'description'], 'string', 'max' => 255],
            [['phone', 'phone_optional'], 'string', 'max' => 24],
            [['country_id'], 'exist', 'skipOnError' => true, 'targetClass' => VenueCountry::className(), 'targetAttribute' => ['country_id' => 'id']],
            [['district_id'], 'exist', 'skipOnError' => true, 'targetClass' => VenueDistrict::className(), 'targetAttribute' => ['district_id' => 'id']],
            [['sity_id'], 'exist', 'skipOnError' => true, 'targetClass' => VenueSity::className(), 'targetAttribute' => ['sity_id' => 'id']],
            [['created_by'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['created_by' => 'id']],
            [['updated_by'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['updated_by' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('yee/venue', 'ID'),
            'country_id' => Yii::t('yee/venue', 'Country ID'),
            'sity_id' => Yii::t('yee/venue', 'Sity ID'),
            'district_id' => Yii::t('yee/venue', 'District ID'),
            'name' => Yii::t('yee/venue', 'Name'),
            'address' => Yii::t('yee/venue', 'Address'),
            'phone' => Yii::t('yee/venue', 'Phone'),
            'phone_optional' => Yii::t('yee/venue', 'Phone Optional'),
            'email' => Yii::t('yee/venue', 'Email'),
            'сontact_person' => Yii::t('yee/venue', 'сontact Person'),
            'latitude' => Yii::t('yee/venue', 'Latitude'),
            'longitude' => Yii::t('yee/venue', 'Longitude'),
            'description' => Yii::t('yee/venue', 'Description'),
            'created_at' => Yii::t('yee/venue', 'Created At'),
            'updated_at' => Yii::t('yee/venue', 'Updated At'),
            'created_by' => Yii::t('yee/venue', 'Created By'),
            'updated_by' => Yii::t('yee/venue', 'Updated By'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCountry()
    {
        return $this->hasOne(VenueCountry::className(), ['id' => 'country_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDistrict()
    {
        return $this->hasOne(VenueDistrict::className(), ['id' => 'district_id']);
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
    public function getCreatedBy()
    {
        return $this->hasOne(User::className(), ['id' => 'created_by']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUpdatedBy()
    {
        return $this->hasOne(User::className(), ['id' => 'updated_by']);
    }
}
