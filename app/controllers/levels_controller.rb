class LevelsController < ApplicationController	

	def show
		@course = Course.find(params[:id])
		@level = Level.find(params[:id])
	end

end