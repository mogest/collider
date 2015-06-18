class CreateAtomNumbers < ActiveRecord::Migration
  def change
    create_table :atom_numbers do |t|
      t.integer :account_id, null: false
      t.integer :next_number, null: false, default: 1

      t.index :account_id, unique: true
      t.timestamps null: false
    end
  end
end
