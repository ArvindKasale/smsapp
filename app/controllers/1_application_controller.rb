class ApplicationController < ActionController::Base
  protect_from_forgery
  
#  stream
  
  def login_required
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end
  
end
