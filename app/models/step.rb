class Step < ActiveRecord::Base
  attr_accessible :instructions, :description, :media_type,
                  :link, :answer, :choice_one, :choice_two,
                  :choice_three, :choice_four
  belongs_to :level

  state_machine initial: :pending do
  	state :pending, value: 0
  	state :finished, value: 1

  	event :finish do
  		transition :pending => :finished
    end

    event :restart do
    	transition :finished => :pending
    end
  end

end
