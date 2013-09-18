class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thanks for signing up!"
      # signin user?
      redirect_to home_url
    else
      flash[:alert] = "Could not signup."
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email,
                                    :password, :password_confirmation)
    end
end
