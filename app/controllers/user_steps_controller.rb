class UserStepsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@step = Step.find(params[:user_step][:step_id])
		current_user.attempt_step!(@step)
		respond_to do |format|
          format.html { redirect_to @step }
          format.js
        end
	end

	def destroy
		@step = Step.find(params[:id]).step
		current_user.remove_user_step!(@step)
		respond_to do |format|
          format.html { redirect_to @step }
          format.js
        end	
	end
end