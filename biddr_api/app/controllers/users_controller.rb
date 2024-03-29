class UsersController < ApplicationController
  def new
      @user = User.new
  end

  def create
      @user = User.new user_params
      if @user.save
          session[:user_id] = @user.id
          flash.delete(:warning)
          redirect_to root_path
      else
          flash[:warning] = "Unable to create user"
          render :new
      end
  end

  def show
      @user=User.find(session[:user_id])
  end

  private

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
