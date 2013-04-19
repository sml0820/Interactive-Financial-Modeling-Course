class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :title
      t.integer :number

      t.timestamps
    end
  end
end
