class StepsController < ApplicationController	

	def show
		@level = Level.find(params[:id])
		@step = Step.find(params[:id])
		@step_count = Step.count('date', :distinct => true) 
	end

end