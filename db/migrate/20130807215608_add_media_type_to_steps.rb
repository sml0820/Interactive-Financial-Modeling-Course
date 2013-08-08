class AddMediaTypeToSteps < ActiveRecord::Migration
  def change
  	add_column :steps, :media_type, :string
  	
  	Step.update_all media_type: 'excel'
  end
end
