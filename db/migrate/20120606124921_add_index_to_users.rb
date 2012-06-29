class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :name, unique: true
    add_index :users, :remember_token
  end
end
