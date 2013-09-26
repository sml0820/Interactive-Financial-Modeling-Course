class AddIdsToUserStep < ActiveRecord::Migration
  def change
    add_column :user_steps, :user_id, :integer
    add_column :user_steps, :step_id, :integer
    add_index :user_steps, :user_id
    add_index :user_steps, :step_id
    add_index :user_steps, [:user_id, :step_id], unique: true
  end

end
