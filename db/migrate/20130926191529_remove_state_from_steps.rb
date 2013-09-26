class RemoveStateFromSteps < ActiveRecord::Migration
  def up
    remove_column :steps, :state
  end

  def down
    add_column :steps, :state, :integer
  end
end
