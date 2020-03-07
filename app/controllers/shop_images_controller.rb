class ShopImagesController < ApplicationController

  def index
    @shop_images = ShopImage.where(shop_id: params[:shop_id])
  end

  def destroy
    @shop_image = ShopImage.find(params[:id])
    @shop_image.destroy
    redirect_to shop_shop_images_path(params[:shop_id])
  end

end
