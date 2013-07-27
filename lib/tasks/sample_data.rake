namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_users
		make_courses
		make_assignments
	end
end

def make_users
	admin = User.create!(name: "Example User",
				 email: "example@rails.org",
				 password: "foobar",
				 password_confirmation: "foobar")
	admin.toggle!(:admin)
	99.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@rails.org"
		password = "password"
		User.create!(name: name, email: email, password: password, 
					 password_confirmation: password)
	end
	
end

def make_courses
	10.times do |n|
		title = "course-#{n+1}"
		description = "course description-#{n+1}"
		typeof= "course"
		Course.create!(title: title, description: description, typeof: typeof)
	end
end


def make_assignments
	users = User.all
	user = users.first
	courses = Course.all
	course = courses.first
	class_takers = users[2..50]
	courses_taken = courses[2..8]
	class_takers.each { |takers| takers.take_course!(course)   }
end
