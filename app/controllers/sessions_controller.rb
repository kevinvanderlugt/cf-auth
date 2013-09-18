class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    # save the current user in the session 
  end

  def destroy
    # remove the current user id from the session
  end
end
