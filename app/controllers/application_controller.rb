class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login_required
    redirect_to root_path if current_user.blank?
  end


  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  rescue ActiveRecord::RecordNotFound
    session.delete(:id)
    nil
  end
end
