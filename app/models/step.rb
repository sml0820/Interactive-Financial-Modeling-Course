class Step < ActiveRecord::Base
  attr_accessible :instructions, :description, :media_type,
                  :excel_link, :excel_answer, :cell_location, :video_link, :choice_one, :choice_two,
                  :choice_three, :choice_four, :mc_answer
  belongs_to :level
  has_many :user_steps, dependent: :destroy
  has_many :users, through: :user_steps
end
