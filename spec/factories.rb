FactoryGirl.define do
	  factory :user do
	    sequence(:name)  { |n| "Person #{n}" }
	    sequence(:email) { |n| "person_#{n}@example.com" }
	    password "foobar"
	    password_confirmation "foobar"

	    factory :admin do
	    	admin true
	    end
	  end

	  factory :course do
	  	sequence(:title) { |n| "Ze Finance Course #{n}" }
	  	sequence(:description) { |n| "Description for course #{n}" }
	  end

	  factory :level do
	  	course
	  	sequence(:title) { |n| "Ze Finance Level #{n}" }
	  end

	  factory :step do
	  	level
	  	sequence(:description) { |n| "Description for course #{n}" }
	  	media_type "excel"
	  end

	
end