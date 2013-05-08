include ApplicationHelper

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-error', text: 'Invalid')
	end
end

def sign_in(user)
		visit new_user_session_path
		fill_in "Email", 			with: user.email
		fill_in "Password", 		with: user.password
		click_button "Sign in"
		#Sign in when not using Capybara.
		# cookies[:remember_token] = user.remember_token
end

  # def login_admin
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:admin]
  #     sign_in FactoryGirl.create(:admin) # Using factory girl as an example
  #   end
  # end

  # def sign_in(user)
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:user]
  #     user = FactoryGirl.create(:user)
  #     user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
  #     sign_in user
  #   end
  # end