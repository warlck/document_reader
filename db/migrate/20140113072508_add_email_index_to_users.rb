class AddEmailIndexToUsers < ActiveRecord::Migration
  def change
  	add_index :users, :auth_token
  	add_index :users, :password_reset_token
  end
end
