class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      
      t.integer :price, null: false
      t.text :explanation, null: false
      t.string :title, null: false
      t.references :user, null: false, foreign_key: true

      t.integer :condition_id, null:false
      t.integer :cost_id, null:false
      t.integer :category_id, null:false
      t.integer :region_id, null:false
      t.integer :schedule_day_id, null:false

      t.timestamps
    end
  end
end
