class UsersController < ApplicationController
  def show
  end

  def index
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to signup_path, notice: "Signup not successful due to #{user.errors.full_messages.to_sentence}"
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
