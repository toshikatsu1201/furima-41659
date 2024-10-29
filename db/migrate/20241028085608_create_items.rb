class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      
      t.integer :price, null: false
      t.text :explanation, null: false
      t.string :title, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
