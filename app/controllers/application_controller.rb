class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    books_path
  end

  # This method is a must when using Devise ONLY with Omniauthable
  def new_session_path(scope)
    new_user_session_path
  end
end
