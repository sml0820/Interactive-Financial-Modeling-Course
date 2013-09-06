class AddChoiceFourToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :choice_four, :text
  end
end
