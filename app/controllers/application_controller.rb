class ApplicationController < ActionController::Base  
  helper_method :current_user

  def current_user
    if session[:user_id]
      facade.user
    end
  end

  private

  def facade
    UserFacade.new(session[:user_id])
  end
end
