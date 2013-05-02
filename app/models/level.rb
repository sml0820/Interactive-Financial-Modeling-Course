class Level < ActiveRecord::Base
  attr_accessible :number, :title, :steps_attributes
  belongs_to :course
  has_many :steps
  accepts_nested_attributes_for :steps, allow_destroy: true
end
