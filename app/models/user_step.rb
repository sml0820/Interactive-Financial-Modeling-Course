class UserStep < ActiveRecord::Base
  attr_accessible :state
  belongs_to :users 
  belongs_to :steps


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
