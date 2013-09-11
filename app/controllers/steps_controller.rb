class StepsController < ApplicationController	

	def show
		@course = Course.find(params[:course_id])
		@level = Level.find(params[:level_id])
		@step = Step.find(params[:id])
		@step_list = @level.steps
		gon.excel_link = @step.excel_link
	end

end