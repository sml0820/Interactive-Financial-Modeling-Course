require 'spec_helper'

describe UserStepsController do

	let(:user) { FactoryGirl.create(:user)}
	let(:step) { FactoryGirl.create(:step)}

	before { sign_in user }

    describe "creating a UserStep with Ajax" do

      it "should increment the UserStep count" do
      	 expect do
      	 	xhr :post, :create, user_step: { step_id: step.id }
      	 end.should change(UserStep, :count).by(1)
      end

      it "should respond with success" do
      	xhr :post, :create, user_step: { step_id: step.id }
      	response.should be_success
      end
    end	

     describe "destroying a UserStep with Ajax" do

     	before { user.attempt_step!(step)}
     	let(:user_step) {user.user_steps.find_by_step_id(step)}

      it "should increment the UserStep count" do
      	 expect do
      	 	xhr :delete, :destroy,  id: user_step.id 
      	 end.should change(UserStep, :count).by(-1)
      end

      it "should respond with success" do
      		xhr :delete, :destroy,  id: user_step.id 
      	response.should be_success
      end
    end	
end