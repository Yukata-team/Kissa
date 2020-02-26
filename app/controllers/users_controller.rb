class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :ensure_correct_user, only: [:edit,:update]

  def show
    @user = User.find(params[:id])
  end

  def edit

  end

  def image_update
    @user = current_user
    @user.save(user_image_params)
    redirect_to user_path(@user), notice: "プロフィール画像を変更しました"
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      flash[:alert] = "権限がありません"
      redirect_to user_path(current_user.id)
    end
  end

  private
  def user_image_params
    params.require(:user).permit(:profile_image)
  end
end
