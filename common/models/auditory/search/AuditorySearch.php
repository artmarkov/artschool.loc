<?php

namespace common\models\auditory\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\auditory\Auditory;

/**
 * AuditorySearch represents the model behind the search form about `common\models\Auditory`.
 */
class AuditorySearch extends Auditory
{
    /**
     * @inheritdoc
     */
    
    public $catName;
    public $buildingName;


    public function rules()
    {
        
        return [
            [['id', 'building_id', 'cat_id', 'num', 'capacity', 'order'], 'integer'],
            [['study_flag', 'name', 'floor', 'description'], 'safe'],
            [['area'], 'number'],
            [['catName','buildingName'], 'string'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Auditory::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => Yii::$app->request->cookies->getValue('_grid_page_size', 20),
            ],
            'sort' => [
                'defaultOrder' => [
                    'id' => SORT_DESC,
                ],
            ],
        ]);
        
        $dataProvider->setSort([
                'attributes' => [
                    'id',
                    'num',
                    'study_flag',
                    'catName' => [
                        'asc' => ['auditory_cat.name' => SORT_ASC],
                        'desc' => ['auditory_cat.name' => SORT_DESC],
                        'label' => 'Cat Name'
                    ],
               'buildingName' => [
                        'asc' => ['auditory_building.name' => SORT_ASC],
                        'desc' => ['auditory_building.name' => SORT_DESC],
                        'label' => 'building Name'
                    ]
                ]
            ]);
        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            $query->joinWith(['auditory_cat']);
       
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
//            'building_id' => $this->building_id,
//            'cat_id' => $this->cat_id,
            
            'num' => $this->num,
            'area' => $this->area,
            'capacity' => $this->capacity,
            'order' => $this->order,
        ]);

        $query->andFilterWhere(['like', 'study_flag', $this->study_flag])
            ->andFilterWhere(['like', 'auditory.name', $this->name])
            ->andFilterWhere(['like', 'floor', $this->floor])
            ->andFilterWhere(['like', 'description', $this->description])
                ;
        
        $query->joinWith(['cat' => function ($q) {
               $q->where('auditory_cat.name LIKE "%' . $this->catName . '%"');
           }]);
         $query->joinWith(['building' => function ($q) {
               $q->where('auditory_building.name LIKE "%' . $this->buildingName . '%"');
           }]);
        return $dataProvider;
    }
}
