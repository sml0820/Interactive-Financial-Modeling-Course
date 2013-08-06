class StepsController < ApplicationController	

	def show
		@course = Course.find(params[:id])
		@level = Level.find(params[:id])
		@step = Step.find(params[:id])
	end

end