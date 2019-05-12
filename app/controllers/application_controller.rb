# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :require_login
  before_action :admin_zone

  private

  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def current_user
    @current_user ||= session[:current_user_id] &&
                      User.find(session[:current_user_id])
  end

  def require_login
    unless current_user
      flash[:error] = 'You must be logged in to access this section'
      redirect_to root_url # halts request cycle
    end
  end

  def admin_zone
    unless current_user.is_admin
      flash[:error] = 'You must be an admin to access this section!'
      redirect_to meetings_path
    end
  end
end
