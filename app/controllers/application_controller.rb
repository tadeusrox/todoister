class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= Todoist.access_token(session[:code])[:access_token] rescue nil
  end
end
