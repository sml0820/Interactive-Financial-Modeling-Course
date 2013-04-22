class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :instructions
      t.text :description
      t.string :cell_location
      t.string :image_location
      t.integer :answer
      t.integer :level_id

      t.timestamps
    end
  end
end
