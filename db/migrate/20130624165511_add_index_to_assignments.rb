class AddIndexToAssignments < ActiveRecord::Migration
  def change
  	add_index :assignments, [:user_id, :course_id], unique: true
  end
end
