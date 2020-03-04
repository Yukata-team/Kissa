class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:destroy]

  def index
    if params[:q].present?
      @q = Shop.ransack(search_params)
      @shop = @q.result
    else
      @q = Shop.ransack()
      @shop = Shop.all
    end
    average
  end

  def average
    @shop.each do |shop|
      if shop.posts.average(:post_total_point) != nil
        shop.total_point = shop.posts.average(:post_total_point).floor(2)
        shop.save
      end
    end
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    if @shop.save
      redirect_to shop_path(@shop), notice: "登録が完了しました"
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
    if @shop.posts.average(:post_total_point) != nil
      @shop.total_point = @shop.posts.average(:post_total_point).floor(2)
      @shop.ave_congestion = @shop.posts.average(:congestion).floor(2)
      @shop.ave_menu = @shop.posts.average(:menu).floor(2)
      @shop.ave_price = @shop.posts.average(:price).floor(2)
      @shop.ave_wifi = @shop.posts.average(:wifi).floor(2)
      @shop.ave_others = @shop.posts.average(:others).floor(2)
    end
    @post_count = 0
    @shop.posts.each do |post|
      if post.shop_id == @shop.id
        @post_count = @post_count + 1
      end
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to user_path(@shop.user.id), notice: "変更を保存しました"
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to user_path(@shop.user.id), notice: "店舗情報を削除しました"
  end

  def search
    if params[:q].present?
      @q = Shop.ransack(search_params)
      @shop = @q.result
    else
      @q = Shop.ransack()
      @shop = Shop.all
    end
    average
  end

  def ensure_correct_user
    @shop = Shop.find(params[:id])
    if @shop.user.id != current_user.id
      flash[:alert] = "権限がありません"
      redirect_to user_path(current_user.id)
    end
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :branch, :furigana, :station_name, :other_name, :business_hour, :head_image, shop_images_images: [])
  end

  def search_params
    params.require(:q).permit(:sorts, :station_name_or_name_or_other_name_cont)
  end

end
