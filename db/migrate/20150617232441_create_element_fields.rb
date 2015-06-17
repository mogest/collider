class CreateElementFields < ActiveRecord::Migration
  def change
    create_table :element_fields do |t|
      t.integer :element_id, null: false
      t.integer :field_id, null: false

      t.index :element_id
      t.index :field_id

      t.timestamps null: false
    end
  end
end
