class CreateAdvertisings < ActiveRecord::Migration
  def change
    create_table :advertisings do |t|
      t.string :title
      t.string :string
      t.string :copy
      t.string :text
      t.integer :price

      t.timestamps null: false
    end
  end
end
