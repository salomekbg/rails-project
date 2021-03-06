class SessionsController < ApplicationController
  def new
    redirect_to current_user unless !logged_in?
  end

  def create
    if (@user = User.find_by(username: params[:user][:username])) && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/signin'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
