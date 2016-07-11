class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:alert] = "Incorrect email/password combination."
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
