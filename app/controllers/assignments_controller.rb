class AssignmentsController < ApplicationController
	before_filter :signed_in_user

	def create
		@course = Course.find(params[:assignment][:course_id])
		current_user.take_course!(@course)
		respond_to do |format|
          format.html { redirect_to @course }
          format.js
        end
	end

	def destroy
		@course = Assignment.find(params[:id]).course
		current_user.remove_course!(@course)
		respond_to do |format|
          format.html { redirect_to @course }
          format.js
        end	
	end
end
