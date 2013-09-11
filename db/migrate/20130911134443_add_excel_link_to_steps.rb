class AddExcelLinkToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :excel_link, :text
  end
end
