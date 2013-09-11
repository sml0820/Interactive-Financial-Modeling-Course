class AddExcelAnswerToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :excel_answer, :integer
  end
end
