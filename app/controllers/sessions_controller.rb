# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[create landingpage]
  skip_before_action :admin_zone, only: %i[create landingpage destroy]

  def create
    auth_hash = request.env['omniauth.auth']
    @user = User.find_by(slack_id: auth_hash['info']['user_id'])
    @user ||= User.create!(slack_id: auth_hash['info']['user_id'], name: auth_hash['info']['name'])
    session[:current_user_id] = @user.id
    flash[:notice] = 'Du hast Dich erfoglreich eingeloggt.'
    redirect_to meetings_url
  end

  # "Delete" a login, aka "log the user out"
  def destroy
    # Remove the user id from the session
    @current_user = session[:current_user_id] = nil
    flash[:notice] = 'Du hast Dich erfolgreich ausgeloggt.'
    redirect_to root_url
  end

  def failure; end

  def landingpage; end
end
