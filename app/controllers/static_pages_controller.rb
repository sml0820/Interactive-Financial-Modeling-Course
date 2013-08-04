class StaticPagesController < ApplicationController
  def home
    @courses = current_user.courses if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end

end
