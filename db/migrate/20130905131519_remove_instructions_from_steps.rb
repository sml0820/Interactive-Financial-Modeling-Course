class RemoveInstructionsFromSteps < ActiveRecord::Migration
  def up
  	remove_column :steps, :instructions
  end

  def down
  	add_column :steps, :instructions, :text
  end
end
