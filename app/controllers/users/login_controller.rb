class Users::LoginController < ApplicationController
  def new
  end

  def create
    user_id = facade.login_user(user_params)

    if user_id
      session[:user_id] = user_id
      redirect_to user_path(user_id)
    else
      flash[:error] = "Your credentials were incorrect, please try again."
      redirect_to login_path
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