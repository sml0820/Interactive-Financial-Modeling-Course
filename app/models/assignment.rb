class Assignment < ActiveRecord::Base
  attr_accessible :course_id
  belongs_to :user
  belongs_to :course

  validates :user_id, presence: true
  validates :course_id, presence: true
end
