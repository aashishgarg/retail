class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
    User.find_by_id(session[:user_id])
  end

  def authorize!
    redirect_to login_path, notice: 'Unauthorized user!' unless current_user
  end
end
