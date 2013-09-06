class AddChoiceTwoToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :choice_two, :text
  end
end
