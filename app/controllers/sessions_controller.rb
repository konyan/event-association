class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'email/password not correct.'
      render 'new'
    end
  end

  def destroy
    signout
    redirect_to signin_path
  end
end
