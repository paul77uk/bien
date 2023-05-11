class ApplicationController < ActionController::Base
  # before any page loads, find the current_user
  before_action :find_current_user

  # add in the method to use in the views
  helper_method :logged_in?

  def find_current_user
    @current_user = User.find(session[:user_id]) if logged_in?
  end

  # check login status
  def check_login
    redirect_to new_session_path unless logged_in?
  end

  # is the person logged in
  def logged_in?
    session[:user_id].present?
  end
end
