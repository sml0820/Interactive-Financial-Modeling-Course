# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
course = Course.create! title: "Rails course"
level = course.levels.create! title: "What testing framework do you prefer?"
level.steps.create! description: "Test::Unit"
level.steps.create! description: "Rspec"
level.steps.create! description: "Minitest"
level.steps.create! description: "Other/None"

level = course.levels.create! title: "How many applications do you have in production?"
level.steps.create! description: "0"
level.steps.create! description: "2"
level.steps.create! description: "35"
level.steps.create! description: "6"

level = course.levels.create! title: "What is the answer to the universe and everything?"
level.steps.create! description: "42"

course = Course.create! title: "What's your favorite Pizza?"
course.levels.create! title: "What's your favorite kind of cheese?"
course.levels.create! title: "Favorite veggie?"
course.levels.create! title: "Favorite meat?"
course.levels.create! title: "Do you like thin, medium, or deep dish crust?"

course = Course.create! title: "Superhero Questionnaire"
course.levels.create! title: "Batman or Superman?"
course.levels.create! title: "Spiderman or Flash?"
course.levels.create! title: "Aquaman or Green Lantern?"