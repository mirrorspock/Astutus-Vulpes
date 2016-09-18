# Basic Controller where all other controllers inherit from
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :find_authenticated_user

  private

  def authenticate(email, password)
    remove_authenticated_user
    save_authenticated_user_id(@authenticated_user.id) if try_to_login(email, password)
  end

  def authenticated?
    @authenticated_user ? true : false
  end

  def find_authenticated_user
    if session[:user_id] && session[:user_id].to_s.match(/^(\d+)/)
      @authenticated_user = User.find_by(id: session[:user_id])
    end
  end

  def remove_authenticated_user
    session[:user_id] = nil
  end

  def save_authenticated_user_id(user_id)
    session[:user_id] = user_id
  end

  def try_to_login(email, password)
    @authenticated_user = User.find_by(email: email).try(:authenticate, password)
    @authenticated_user = nil unless @authenticated_user
    authenticated?
  end

  def require_authenticated_user
    unless @authenticated_user
      flash[:notice] = 'Authenticated user is required'
      redirect_to(login_path)
    end
  end
end
