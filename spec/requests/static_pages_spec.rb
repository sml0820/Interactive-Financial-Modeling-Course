require 'spec_helper'

	describe "Static pages" do

	subject { page }

	describe "Home page" do

	  	before { visit root_path}

	  	it { should have_selector('h1', text: 'finance institute')}
	  	it { should have_selector('title', text: full_title('')) }
	  	it { should_not have_selector('title', text: '| Home') }

	  	describe "for signed-in users" do
	  		let(:user) { FactoryGirl.create(:user)}
	  		before do
	  			sign_in user
	  			visit root_path
	  		end

	  		describe "taking course counts" do
	  			let(:course) {FactoryGirl.create(:course)}
	  			before do 
	  				user.take_course!(course)
	  				visit root_path
	  			end

	  			it { should have_link("1 courses", href: courses_user_path(user))}

	  		end
	  	end

	end
	describe "Help page" do

	  	before { visit help_path}
	    it { should have_selector('h1', text: 'Help') }
	  	it { should have_selector('title', text: full_title('Help')) }		
	end
	describe "About page" do

	   	before {visit about_path}
	    it { should have_selector('h1', text: "About Us") }
		it { should have_selector('title', text: full_title('About Us')) }
	end
	describe "Contact page" do

	  	before {visit contact_path}
	    it { should have_selector('h1', text: "Contact") }
		it { should have_selector('title', text: full_title('Contact')) }
		
	end
	it "should have the right links on the layout" do
		visit root_path
		click_link "Sign in"
		page.should have_selector 'title', text: full_title('Sign in')
		click_link "About"
		page.should have_selector 'title', text: full_title('About Us')
		click_link "Help"
		page.should have_selector 'title', text: full_title('Help')
		click_link "Contact"
		page.should have_selector 'title', text: full_title('Contact')
		click_link "Home"
		page.should have_selector 'title', text: full_title('')
		click_link "finance institute"
		page.should have_selector 'h1', text: 'finance institute'
	end
end
