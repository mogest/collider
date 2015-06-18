class CreateAtoms < ActiveRecord::Migration
  def change
    create_table :atoms do |t|
      t.integer :account_id, null: false
      t.integer :element_id, null: false, index: true
      t.integer :parent_atom_id

      t.integer :number, null: false
      t.index [:account_id, :number], unique: true

      t.integer :created_by_user_id

      t.timestamps null: false
    end
  end
end
