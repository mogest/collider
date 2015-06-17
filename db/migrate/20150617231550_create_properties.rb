class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :atom_id, null: false
      t.integer :field_id, null: false
      t.index [:atom_id, :field_id], unique: true
      t.index :field_id

      t.text :text_value
      t.integer :integer_value
      t.boolean :boolean_value
      t.datetime :datetime_value

      t.integer :parent_property_id, index: true
      t.integer :created_by_user_id, index: true

      t.datetime :created_at, null: false
      t.index :created_at
      t.datetime :obsolete_at
      t.index :obsolete_at
    end
  end
end
