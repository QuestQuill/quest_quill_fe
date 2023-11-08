class Users::Login::EmailLoginController < ApplicationController
  def new
    user = facade.search_user({email: params[:email_passwordless]})
    if user
      token = SecureRandom.urlsafe_base64
      facade.update_token(user, token)
      UserMailer.with(email: params[:email_login]).passwordless_login.deliver_now
    else
      flash[:error] = "This email does not exist in our database, please create a new account."
      redirect_to login_path
    end
  end

  def create
    user = facade.search_user({token: params[:token]})

    session[:user_id] = user.id

    redirect_to user_path(user.id)
  end

  private
  
  def facade
    UserFacade.new(params[:id])
  end
end