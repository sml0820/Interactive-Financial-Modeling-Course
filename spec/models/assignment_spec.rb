require 'spec_helper'

describe Assignment do
	  let(:course) {FactoryGirl.create(:user)}
	  let(:user) {FactoryGirl.create(:user)}
	  let(:assignment) { user.assignments.build(course_id: course.id)}

	subject { assignment }
	it { should be_valid}

	describe "accessible attributes" do
		it " should not allow access to user_id" do
			expect do
				Assignment.new(user_id: user.id)
			end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
	    end
	end

	describe "user methods" do
		it { should respond_to(:user)}
		it { should respond_to(:course)}
		its(:user) { should == user}
		its(:course) { should == course}
	end

	describe "when user it is not present" do
	  before { assignment.user_id = nil}
	  it { should_not be_valid}
	end

	describe "when followed it is not present" do
		before { assignment.course_id = nil }
		it { should_not be_valid}
	end

end
