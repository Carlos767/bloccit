class CreateTopics < ActiveRecord::Migration
  def change

  	drop_table :topics
    create_table :topics do |t|
      t.string :name
      t.text :description
      t.boolean :public

      t.timestamps null: false
    end
  end
end
