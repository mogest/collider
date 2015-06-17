class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.integer :account_id, null: false
      t.index :account_id

      t.string :name, null: false
      t.string :field_type, null: false
      t.string :data_type, null: false

      t.timestamps null: false
    end
  end
end
