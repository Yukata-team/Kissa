class ShopsController < ApplicationController

  def index
    @q = Shop.ransack(params[:q])
    @shop = @q.result
    @shop.each do |shop|
      if shop.posts.average(:post_total_point) != nil
        shop.total_point = shop.posts.average(:post_total_point).floor(2)
      end
    end
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to shop_path(@shop)
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
  end

  def search
    @q = Shop.ransack(params[:q])
    @shop = @q.result
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :station_name)
  end
end
