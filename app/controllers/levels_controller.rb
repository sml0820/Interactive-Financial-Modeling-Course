class LevelsController < ApplicationController
    before_filter :authenticate_user!	

	def show
		@course = Course.find(params[:id])
		@level = Level.find(params[:id])
	end

end