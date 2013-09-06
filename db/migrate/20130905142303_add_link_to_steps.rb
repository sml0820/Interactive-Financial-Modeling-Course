class AddLinkToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :link, :text
  end
end
