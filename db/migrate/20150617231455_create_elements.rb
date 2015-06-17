class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.integer :account_id, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
