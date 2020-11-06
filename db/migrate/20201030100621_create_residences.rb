class CreateResidences < ActiveRecord::Migration[6.0]
  def change
    create_table :residences do |t|

      t.timestamps
      t.string :post, null: false
      t.integer :area_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building, null: false
      t.string :phone, null: false
      t.references :record, foregin_key: true
    end
  end
end
