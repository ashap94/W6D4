class ChangeUsersColumnsToUsername < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :name
    remove_index :users, :email
    rename_column :users, :name, :username
    remove_column :users, :email
    add_index :users, :username, unique: true
  end
end
