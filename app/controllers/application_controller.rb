class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', :notice => exception.message
  end
  
#  stream
  
  def login_required
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end
  
end
