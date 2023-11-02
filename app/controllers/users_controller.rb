class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
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
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:error] = "Your credentials were incorrect, please try again."
      redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to "/"
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end