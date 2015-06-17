class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :atom_id, null: false, index: true

      t.text :body, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
      t.index :created_at
    end
  end
end
