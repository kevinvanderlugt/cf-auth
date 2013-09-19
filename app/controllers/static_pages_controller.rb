class StaticPagesController < ApplicationController
  before_action :authenticate_user, only: :secret

  def home
  end

  def secret
  end

  private
    def authenticate_user
      unless current_user?
        flash[:alert] = "Please signin to access this page"
        redirect_to signin_path
      end
    end
end
