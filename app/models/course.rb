class Course < ActiveRecord::Base
  attr_accessible :description, :title, :type
  has_many :assignments
  has_many :users, through: :assignments
  has_many :levels
end
