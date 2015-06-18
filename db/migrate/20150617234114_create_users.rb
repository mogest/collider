class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.index :email, unique: true

      t.string :token, null: false

      t.string :name
      t.string :preferred_name

      t.boolean :admin, null: false, default: false

      t.timestamps null: false
    end
  end
end
