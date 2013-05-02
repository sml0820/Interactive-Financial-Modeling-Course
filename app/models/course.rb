class Course < ActiveRecord::Base
  attr_accessible :description, :title, :typeof, :levels_attributes
  has_many :assignments
  has_many :users, through: :assignments
  has_many :levels
  accepts_nested_attributes_for :levels, allow_destroy: true
end
