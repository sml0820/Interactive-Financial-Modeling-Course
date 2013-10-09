require 'spec_helper'

describe "UserPages" do

	subject { page }

	describe "index" do

	    let(:user) { FactoryGirl.create(:user) }

	    before(:all) { 30.times { FactoryGirl.create(:user) } }
	    after(:all)  { User.delete_all }

	    before(:each) do
	      sign_in user
	      visit users_path
	    end

	    it { should have_selector('title', text: 'All users') }
	    it { should have_selector('h1',    text: 'All users') }

	    describe "pagination" do
	      it { should have_selector('div.pagination') }

	      it "should list each user" do
	        User.paginate(page: 1).each do |user|
	          page.should have_selector('li>a', text: user.name)
	        end
	      end      
	    end

	    # describe "delete links" do
	    # 	it { should_not have_link('delete')}

	    # 	describe "as an admin user" do
	    # 		let(:admin) { FactoryGirl.create(:admin)}
	    # 		before do
	    # 			sign_in admin
	    # 			visit users_path
	    # 		end

	    # 		it { should have_link('delete', href: user_path(User.first))}
	    # 		it "should be able to delete another user" do
	    # 			expect { clink_link('delete').to change(User, :count).by(-1)}
	    # 		end
	    # 		it { should_not have_link('delete', href: user_path(admin))}
	    # 	end
	    # end
	end
	describe "signup page" do
		before { visit new_user_registration_path }

		it { should have_selector('h1', text: 'Sign up') }
		it { should have_selector('title', text: full_title('Sign up')) }
	end

	describe "profile page" do
		let(:user){ FactoryGirl.create(:user) }
		before {visit user_path(user)}

		it { should have_selector('h1', text: user.name)}
		it { should have_selector('title', text: user.name)}

		describe "take/remove course buttons" do
			let(:course) { FactoryGirl.create(:course)}
			before { sign_in user}

			describe "taking a course" do
				before { visit course_path(course)}

				it "should increment the user course count" do
					expect do
						click_button "Take Course"
					end.to change(user.courses, :count).by(1)
				end

				describe "toggling the button" do
					before { click_button "Take Course"}
					it {  should have_selector('input', value: 'Remove Course')}
				end

			end

			describe "removing a course" do
				before do
					user.take_course!(course)
					visit course_path(course)	
				end

				it "should decrement the user course count" do
					expect do
						click_button "Remove Course"
					end.to change(user.courses, :count).by(-1)
				end

				describe "toggling the button" do
					before { click_button "Remove Course"}
					it {  should have_selector('input', value: 'Take Course')}
				end
			end
		end
	end

	describe "signup" do

		before { visit new_user_registration_path}

		let (:submit) { "Create my account"}

		describe "with invalid information" do
			it "should not create a user" do
				expect {click_button submit }.not_to change(User, :count)
			end

			describe "after submission" do
				before { click_button submit }

				it { should have_selector('title', text: 'Sign up')}
				it { should have_content('error')}
				it { should_not have_content('Password digest')}
			end
		end

		describe "with valid information" do

			before do
				fill_in "user[name]", 		with: "Example User"
				fill_in "user[email]", 		with: "user@example.com"
				fill_in "user[password]", 	with: "foobar"
				fill_in "user[password_confirmation]", with: "foobar"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving a user" do
				before { click_button submit }

				let(:user) { User.find_by_email("user@example.com") }

				# it { should have_selector('title', text: user.name) }
				# it { should have_selector('div.alert.alert-success', text: 'Welcome')}
				it { should have_link('Sign out')}
			end
		end
	end

	describe "edit" do
		let(:user) {FactoryGirl.create(:user)}
		before do
			sign_in user
			visit edit_user_registration_path(user)
		end

		describe "page" do
			

			it { should have_selector('h1', text: "Update your profile")}
			it { should have_selector('title', text: "Edit user")}
			it { should have_link('change', href: "http://gravatar.com/emails")}
		end

		describe "with invalid information" do
			before { click_button "Save changes"}
			it { should have_content('error')}

		end
		# describe "with valid information" do
		# 	let(:new_name) {"New Name"}
		# 	let(:new_email) {"new@example.com"}
		# 	before do
		# 		fill_in "Name", 			with: new_name
		# 		fill_in "Email", 			with: new_email
		# 		fill_in "Password", 		with: user.password
		# 		fill_in "Password Confirmation", with: user.password
		# 		click_button "Save changes"
		# 	end
		# 	it { should have_selector('title', text: new_name)}
		# 	it { should have_link('Sign out', href: destroy_user_session_path)}
		# 	it { should have_selector('div.alert.alert-success')}
		# 	specify { user.reload.name.should == new_name }
		# 	specify { user.reload.email.should == new_email }
		# end
	end
    describe "User Courses" do


      let(:course) {FactoryGirl.create(:course)}

	    before do
	      @attr = {
	      :name => "Example User",
	      :email => "user@example.com",
	      :password => "changeme",
	      :password_confirmation => "changeme"
	      }
	      @user = User.new(@attr)
	      @user.save
	      @user.take_course!(course)
	 
	        sign_in @user
	        visit courses_user_path(@user)
	      end

	       it { should have_selector('title', text: full_title('User Courses'))}
	       it { should have_selector('h3', text: 'User Courses')}
	       it { should have_link(course.title, href: course_path(course))}
	     end
end
