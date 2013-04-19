class Level < ActiveRecord::Base
  attr_accessible :number, :title
  belongs_to :course
end
