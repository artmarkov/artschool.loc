<?php

use yii\db\Migration;

/**
 * Class m181206_190843_catalog
 */
class m181206_190843_catalog extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%catalog}}', [
            'id' => $this->primaryKey(),
            'tree' => $this->integer()->notNull(),
            'lft' => $this->integer()->notNull(),
            'rgt' => $this->integer()->notNull(),
            'depth' => $this->integer()->notNull(),
            'name' => $this->string()->notNull(),
             'url' => $this->string(64)->notNull(),
             'text' => $this->string(127),
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m181206_190843_catalog cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m181206_190843_catalog cannot be reverted.\n";

        return false;
    }
    */
}
