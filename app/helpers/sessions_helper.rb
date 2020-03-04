module SessionsHelper
  def log_in(user)
    user.remember
    cookies.permanent[:remember_token] = user.remember_token
    @current_user = user
  end

  def check_login
    return unless current_user.nil?

    flash[:danger] = 'You need to Login first'
    redirect_to signin_path
  end

  def current_user
    @current_user ||= User.find_by(remember_digest: User.digest(cookies[:remember_token]))
  end

  def current_user=(user)
    @current_user = user
  end

  def signout
    @current_user = nil
    cookies[:remember_token] = nil
    session[:user_id] = nil
  end
end
