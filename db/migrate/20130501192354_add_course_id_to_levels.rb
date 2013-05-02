class AddCourseIdToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :course_id, :integer
  end
end
