class AssignmentsController < ApplicationController
	before_filter :signed_in_user

	def create
		@course = Course.find(params[:assignment][:course_id])
		current_user.take_course!(@course)
		redirect_to @course
	end

	def destroy
		
	end
end
