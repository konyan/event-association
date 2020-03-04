class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])
    @upcoming_events = current_user.attended_events.upcoming_event
    @previous_events = current_user.attended_events.previous_event
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Successfully registered users'
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
