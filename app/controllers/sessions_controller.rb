class SessionsController < ApplicationController
  def new
  end

  def create
# "session"=>{"email"=>"nyan@gmail.com", "password"=>"[FILTERED]"}
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] ="email/password not correct."
      render 'new'
    end
  end
end
