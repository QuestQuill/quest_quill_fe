class UserMailer < ApplicationMailer
  default from: "login@quest-quill.com"

  def passwordless_login
    facade = UserFacade.new(nil)
    @user = facade.search_user(email: params[:email])
    @url = "http://localhost:5000/email_login_success?token=#{@user.token}"
    mail(to: @user.email, subject: "Passwordless Login Request")
  end
end