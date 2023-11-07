class UsersController < ApplicationController
  def new
  end

  def show
    @user = user_facade.user
  end

  def create
    user = user_facade.create_user(user_params)

    if !user.nil?
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:error] = "Your account could not be created, please try again."
      redirect_to new_user_path
    end
  end

  def login_form
  end

  def login
    user_id = user_facade.login_user(user_params)

    if user_id
      session[:user_id] = user_id
      redirect_to user_path(user_id)
    else
      flash[:error] = "Your credentials were incorrect, please try again."
      redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end

  def user_facade
    UserFacade.new(params[:id])
  end
end