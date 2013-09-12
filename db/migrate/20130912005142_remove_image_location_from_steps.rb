class RemoveImageLocationFromSteps < ActiveRecord::Migration
  def up
    remove_column :steps, :image_location
  end

  def down
    add_column :steps, :image_location, :string
  end
end
