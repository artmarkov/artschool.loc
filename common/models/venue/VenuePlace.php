<?php

namespace common\models\venue;

use Yii;
use yeesoft\models\User;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\TimestampBehavior;
use common\models\venue\VenueDistrict;
use common\models\venue\VenueCountry;
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
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
            BlameableBehavior::className(),
        ];
    }
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['country_id', 'name', 'address', 'phone'], 'required'],
            ['district_id', 'required', 'when' => function ($model) { return !empty(VenueDistrict::getDistrictBySityId($model->sity_id));}, 'enableClientValidation' => false ],                 ['district_id', 'required', 'when' => function ($model) { return !empty(VenueDistrict::getDistrictBySityId($model->sity_id));}, 'enableClientValidation' => false ], 
            ['sity_id', 'required', 'when' => function ($model) { return !empty(VenueSity::getSityByCountryId($model->country_id));}, 'enableClientValidation' => false ],         
            [['country_id', 'sity_id', 'district_id'], 'integer'],
            ['email', 'email'],
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
            'id' => Yii::t('yee/guide', 'ID'),
            'country_id' => Yii::t('yee/guide', 'Country ID'),
            'sity_id' => Yii::t('yee/guide', 'Sity ID'),
            'district_id' => Yii::t('yee/guide', 'District ID'),
            'name' => Yii::t('yee/guide', 'Name Place'),
            'address' => Yii::t('yee/guide', 'Address'),
            'phone' => Yii::t('yee/guide', 'Phone'),
            'phone_optional' => Yii::t('yee/guide', 'Phone Optional'),
            'email' => Yii::t('yee/guide', 'Email'),
            'сontact_person' => Yii::t('yee/guide', 'Contact Person'),
            'latitude' => Yii::t('yee/guide', 'Latitude'),
            'longitude' => Yii::t('yee/guide', 'Longitude'),
            'description' => Yii::t('yee/guide', 'Description Venue'),
            'created_at' => Yii::t('yee', 'Created At'),
            'updated_at' => Yii::t('yee', 'Updated At'),
            'created_by' => Yii::t('yee', 'Created By'),
            'updated_by' => Yii::t('yee', 'Updated By'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCountry()
    {
        return $this->hasOne(VenueCountry::className(), ['id' => 'country_id']);
    }

    /* Геттер для названия страны */
    public function getCountryName()
    {
        return $this->country->name;
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDistrict()
    {
        return $this->hasOne(VenueDistrict::className(), ['id' => 'district_id']);
    }

    /* Геттер для названия округа */
    public function getDistrictName()
    {
        return $this->district->name;
    }
    /* Геттер для короткого названия округа */
    public function getDistrictSlug()
    {
        return $this->district->slug;
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSity()
    {
        return $this->hasOne(VenueSity::className(), ['id' => 'sity_id']);
    }

    /* Геттер для названия города */
    public function getSityName()
    {
        return $this->sity->name;
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCreatedBy()
    {
        return $this->hasOne(\common\models\auth\User::className(), ['id' => 'created_by']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUpdatedBy()
    {
        return $this->hasOne(\common\models\auth\User::className(), ['id' => 'updated_by']);
    }
    /**
     * Get created date
     *
     * @param string $format date format
     * @return string
     */
    public function getCreatedDate($format = 'd-m-Y')
    {
        return date($format, ($this->isNewRecord) ? time() : $this->created_at);
    }

    /**
     * Get created date
     *
     * @param string $format date format
     * @return string
     */
    public function getUpdatedDate($format = 'd-m-Y')
    {
        return date($format, ($this->isNewRecord) ? time() : $this->updated_at);
    }

    /**
     * Get created time
     *
     * @param string $format time format
     * @return string
     */
    public function getCreatedTime($format = 'H:i')
    {
        return date($format, ($this->isNewRecord) ? time() : $this->created_at);
    }

    /**
     * Get created time
     *
     * @param string $format time format
     * @return string
     */
    public function getUpdatedTime($format = 'H:i')
    {
        return date($format, ($this->isNewRecord) ? time() : $this->updated_at);
    }
    /**
     * Get created datetime
     *
     * @return string
     */
    public function getCreatedDatetime()
    {
        return "{$this->createdDate} {$this->createdTime}";
    }

    /**
     * Get created datetime
     *
     * @return string
     */
    public function getUpdatedDatetime()
    {
        return "{$this->updatedDate} {$this->updatedTime}";
    }
}
