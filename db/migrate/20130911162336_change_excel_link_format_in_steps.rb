class ChangeExcelLinkFormatInSteps < ActiveRecord::Migration
def change
    change_column :steps, :excel_link, :string
  end
end
