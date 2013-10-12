class UserStepsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@step = Step.find(params[:user_step][:step_id])
		current_user.attempt_step!(@step)
		respond_to do |format|
          format.html { redirect_to course_level_step_url(@step.level.course.id, @step.level.id, @step.id)}
          format.js
        end
	end

	def destroy
		@step = UserStep.find(params[:id]).step
		current_user.remove_user_step!(@step)
		respond_to do |format|
          format.html { redirect_to course_level_step_url(@step.level.course.id, @step.level.id, @step.id) }
          format.js
        end	
	end
end