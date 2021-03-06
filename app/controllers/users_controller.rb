class UsersController < ApplicationController
before_filter :signed_in_user, only: [:index, :edit, :update, :courses]
before_filter :correct_user, only: [:edit, :update]
before_filter :admin_user,  only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to the finance institute!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
  def edit
   
  end

  def update
      if @user.update_attributes(params[:user])
        sign_in @user
        flash[:success] = "Profile updated"
        redirect_to @user
      else
      render 'edit'
      end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
    redirect_to users_path
  end

  def courses
    @title = "User Courses"
    @user = User.find(params[:id])
    @courses = @user.courses
    render 'show_courses'
  end
  

  private

    def signed_in_user
      unless user_signed_in?
        store_location
      redirect_to new_user_session_path, notice: "Please sign in." unless user_signed_in?
      end
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

    def admin_user
      redirect_to root_path unless current_user.try(:admin?)
    end
end
