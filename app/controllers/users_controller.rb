class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only [:index]

  def index
    @user = user.all
  end

  private
  def authenticate_admin!
    unless current_user.is_admin?
      redirect_to root_path
    end
  end
end
