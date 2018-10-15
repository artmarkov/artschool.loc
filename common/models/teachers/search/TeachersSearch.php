<?php

namespace common\models\teachers\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\teachers\Teachers;

/**
 * TeachersSearch represents the model behind the search form about `common\models\teachers\Teachers`.
 */
class TeachersSearch extends Teachers
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'timestamp_serv', 'timestamp_serv_spec'], 'integer'],
            [['position_id', 'work_id', 'level_id', 'tab_num'], 'safe'],
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
        $query = Teachers::find();

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

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'timestamp_serv' => $this->timestamp_serv,
            'timestamp_serv_spec' => $this->timestamp_serv_spec,
        ]);

        $query->andFilterWhere(['like', 'position_id', $this->position_id])
            ->andFilterWhere(['like', 'work_id', $this->work_id])
            ->andFilterWhere(['like', 'level_id', $this->level_id])
            ->andFilterWhere(['like', 'tab_num', $this->tab_num]);

        return $dataProvider;
    }
}
