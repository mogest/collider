class AddAccountToUser < ActiveRecord::Migration
  def change
    add_column :users, :account_id, :integer, null: false
  end
end
