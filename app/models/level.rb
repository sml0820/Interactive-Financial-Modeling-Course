class Level < ActiveRecord::Base
  attr_accessible :number, :title
  belongs_to :course
  has_many :steps
end
