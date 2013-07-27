module SessionsHelper


	def current_user?(user)
		user == current_user
	end


	def store_location
		session[:return_to] = request.fullpath
	end

	def signed_in?
		!current_user.nil?
	end

    def signed_in_user
      unless user_signed_in?
        store_location
      redirect_to new_user_session_path, notice: "Please sign in." unless user_signed_in?
      end
    end


end
