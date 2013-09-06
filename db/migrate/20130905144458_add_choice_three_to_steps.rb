class AddChoiceThreeToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :choice_three, :text
  end
end
