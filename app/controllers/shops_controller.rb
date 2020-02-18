class ShopsController < ApplicationController
  def index
    @q = Shop.ransack(params[:q])
    @shop = @q.result
  end
  def new
    @shop = Shop.new
  end
  def create
    @shop = Shop.new(shop_params)
    @shop.save
    redirect_to shop_path(@shop)
  end
  def show
    @shop = Shop.find(params[:id])
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
