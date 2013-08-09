class StepsController < ApplicationController	

	def show
		@level = Level.find(params[:level_id])
		@step = Step.find(params[:id])
		@step_list = @level.steps
	end

end