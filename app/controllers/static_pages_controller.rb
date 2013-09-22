class StaticPagesController < ApplicationController
  def home
    @courses = current_user.courses if signed_in?
    @user = current_user
  end

  def help
  end

  def about
  end

  def contact
  end

end
