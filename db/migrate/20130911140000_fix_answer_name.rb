class FixAnswerName < ActiveRecord::Migration
  def change
    rename_column :steps, :answer, :mc_answer
  end
end
