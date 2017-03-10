class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    books_path
  end

  # This method is a must when using Devise ONLY with Omniauthable
  def new_session_path(scope)
    new_user_session_path
  end
end
