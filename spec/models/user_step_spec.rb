require 'spec_helper'

describe UserStep do
  let(:user) { FactoryGirl.create(:user)}
  let(:step) { FactoryGirl.create(:step)}
  let(:user_step) { user.user_steps.build(step_id: step.id)}

  subject {user_step}

  it { should be_valid}

  	describe "accessible attributes" do
		it " should not allow access to user_id" do
			expect do
				UserStep.new(user_id: user.id)
			end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
	    end
	end

	describe "user methods" do
		it { should respond_to(:user)}
		it { should respond_to(:step)}
		its(:user) { should == user}
		its(:step) { should == step}
	end

	describe "when user id is not present" do
	  before { user_step.user_id = nil}
	  it { should_not be_valid}
	end

	describe "when step id is not present" do
		before { user_step.step_id = nil }
		it { should_not be_valid}
	end
end
