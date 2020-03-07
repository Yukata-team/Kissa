class ShopImagesController < ApplicationController

  def index
    @shop_images = ShopImage.where(shop_id: params[:shop_id])
    @new_shop_images = ShopImage.new
  end

  def destroy
    @shop_image = ShopImage.find(params[:id])
    @shop_image.destroy
    redirect_to shop_shop_images_path(params[:shop_id]), notice: "写真を削除しました"
  end

  def create
    @new_shop_images = ShopImage.new(shop_image_params)
    @new_shop_images.shop_id = params[:shop_id]
    if @new_shop_images.save
      redirect_to shop_shop_images_path, notice: "写真を追加しました"
    else
      @shop_images = ShopImage.where(shop_id: params[:shop_id])
      render :index
    end
  end

  private
  def shop_image_params
    params.require(:shop_image).permit(:image)
  end

end
