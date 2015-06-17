class CreateAtoms < ActiveRecord::Migration
  def change
    create_table :atoms do |t|
      t.integer :account_id, null: false
      t.index :account_id

      t.integer :number, null: false
      t.index [:account_id, :number], unique: true

      t.integer :parent_atom_id
      t.integer :element_id, null: false

      t.integer :created_by_user_id, null: false

      t.timestamps null: false
    end
  end
end
