class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|

      t.timestamps
      t.references :user, foregin_key: true
      t.references :item, foregin_key: true
    end
  end
end
