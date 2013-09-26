class CreateUserSteps < ActiveRecord::Migration
  def change
    create_table :user_steps do |t|
      t.string :state

      t.timestamps
    end
  end
end
