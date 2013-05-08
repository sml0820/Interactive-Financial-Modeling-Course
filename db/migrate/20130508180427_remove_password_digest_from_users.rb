class RemovePasswordDigestFromUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :password_digest
  	remove_column :users, :remember_token
  end

  def down
  	add_column :users, :password_digest
  	add_column :users, :remember_token
  end
end
