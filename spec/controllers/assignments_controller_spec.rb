require 'spec_helper'

describe AssignmentsController do

	let(:user) { FactoryGirl.create(:user)}
	let(:course) { FactoryGirl.create(:course)}

	before { sign_in user }

    describe "creating an assignment with Ajax" do

      it "should increment the Assignment count" do
      	 expect do
      	 	xhr :post, :create, assignment: { course_id: course.id }
      	 end.should change(Assignment, :count).by(1)
      end

      it "should respond with success" do
      	xhr :post, :create, assignment: { course_id: course.id }
      	response.should be_success
      end
    end	

     describe "destroying an assignment with Ajax" do

     	before { user.take_course!(course)}
     	let(:assignment) {user.assignments.find_by_course_id(course)}

      it "should increment the Assignment count" do
      	 expect do
      	 	xhr :delete, :destroy,  id: assignment.id 
      	 end.should change(Assignment, :count).by(-1)
      end

      it "should respond with success" do
      		xhr :delete, :destroy,  id: assignment.id 
      	response.should be_success
      end
    end	
end