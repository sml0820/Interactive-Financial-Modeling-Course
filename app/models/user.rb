class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  has_many :assignments, dependent: :destroy
  has_many :courses, through: :assignments
  has_many :user_steps, dependent: :destroy


# course methods
  def taking_course?(course)
    assignments.find_by_course_id(course.id)
  end

  def take_course!(course)
    assignments.create!(course_id: course.id)
  end

  def remove_course!(course)
    assignments.find_by_course_id(course.id).destroy    
  end

# step methods
  def attempted_step?(step)
    user_steps.find_by_step_id(step.id)
  end

  def attempt_step!(step)
    user_steps.create!(step_id: step.id)
  end

  def remove_user_step!(step)
    user_steps.find_by_step_id(step.id).destroy    
  end

end

