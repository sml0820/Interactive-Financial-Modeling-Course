class UserStep < ActiveRecord::Base
  attr_accessible :state
  attr_accessible :step_id
  belongs_to :user 
  belongs_to :step

  validates :user_id, presence: true
  validates :step_id, presence: true


  state_machine initial: :pending do
  	state :pending, value: :pending
  	state :finished, value: :finished

  	event :finish do
  		transition :pending => :finished
    end

    event :restart do
    	transition :finished => :pending
    end
  end
end
