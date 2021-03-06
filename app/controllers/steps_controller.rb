class StepsController < ApplicationController	
	before_filter :authenticate_user!

	def show
		@course = Course.find(params[:course_id])
		@level = Level.find(params[:level_id])
		@step = Step.find(params[:id])
		@step_list = @level.steps
		# @user_step = current_user.user_steps.find(params[:id])
		gon.excel_link = @step.excel_link
		gon.cell_location = @step.cell_location
		gon.excel_answer = @step.excel_answer
		gon.mc_answer = @step.mc_answer
	end

end