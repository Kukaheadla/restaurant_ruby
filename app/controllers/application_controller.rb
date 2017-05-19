class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  def current_user
    User.find_by(id: session[:id])
  end

  def logged_in?
    !!current_user
  end
end
