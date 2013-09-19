class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # save the current user in the session 
      flash[:notice] = "You have been signed in"
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash.now[:alert] = "Incorrect email/password combination."
      render 'new'
    end
  end

  def destroy
    if session[:user_id].present?
      session.delete(:user_id)
      flash[:alert] = "You have been signed out!"
    end
    redirect_to root_url
  end
end
