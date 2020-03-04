class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'invalid email'
      render 'new'
    end
  end

  def destroy
    signout
    redirect_to signin_path
  end
end
