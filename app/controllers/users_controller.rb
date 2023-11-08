class UsersController < ApplicationController
  def new
  end

  def show
    @user = facade.user
  end

  def create
    user = facade.create_user(user_params)

    if !user.nil?
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:error] = "Your account could not be created, please try again."
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end

  def facade
    UserFacade.new(params[:id])
  end
end