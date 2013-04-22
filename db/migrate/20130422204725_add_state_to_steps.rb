class AddStateToSteps < ActiveRecord::Migration
  def change
  	add_column :steps, :state, :integer
  	add_index :steps, :state
  end
end
