class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.string :post_code, null: false
      t.integer :region_id, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building
      t.string :tel, null: false
      t.references :record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
