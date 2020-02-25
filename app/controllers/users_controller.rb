class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit,:update]

  def show
    @user = current_user
  end

  def edit

  end

  def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      flash[:alert] = "権限がありません"
      redirect_to user_path(current_user.id)
    end
  end
end
