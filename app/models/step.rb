class Step < ActiveRecord::Base
  attr_accessible :instructions, :description, :media_type,
                  :excel_link, :excel_answer, :cell_location, :video_link, :choice_one, :choice_two,
                  :choice_three, :choice_four, :mc_answer
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
