class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  public
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private

  def require_login
    unless current_user
      redirect_to root_path, flash: {error: "Access denied."}
    end
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout(user)
    session[:user_id] = nil
  end

end
