module SessionsHelper


	def current_user?(user)
		user == current_user
	end


	def store_location
		session[:return_to] = request.fullpath
	end


end
