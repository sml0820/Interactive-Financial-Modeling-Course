class AddChoiceOneToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :choice_one, :text
  end
end
