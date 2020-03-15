class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:destroy]
  before_action :checked_shop, only: [:index]

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
    set_address
    if @shop.save
      redirect_to shop_path(@shop), notice: "登録が完了しました"
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
    user_shop_post
    if @shop.posts.average(:post_total_point) != nil
      @shop.total_point = @shop.posts.average(:post_total_point).floor(2)
      @shop.ave_congestion = @shop.posts.average(:congestion).floor(2)
      @shop.ave_menu = @shop.posts.average(:menu).floor(2)
      @shop.ave_price = @shop.posts.average(:price).floor(2)
      @shop.ave_wifi = @shop.posts.average(:wifi).floor(2)
      @shop.ave_others = @shop.posts.average(:others).floor(2)
    else
      @shop.total_point = nil
    end
    @post_count = 0
    @shop.posts.each do |post|
      if post.shop_id == @shop.id
        @post_count = @post_count + 1
      end
    end
    @shop.post_count = @post_count
    @shop.save
    session[:checked_shop_id] = @shop.id
    @hash = Gmaps4rails.build_markers(@shop) do |shop, marker|
      marker.lat shop.latitude
      marker.lng shop.longitude
      marker.infowindow shop.name+shop.branch
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    set_address
    if @shop.update(shop_params)
      redirect_to shop_path(@shop.id), notice: "変更を保存しました"
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to user_path(@shop.user.id), notice: "店舗情報を削除しました"
  end

  def ensure_correct_user
    @shop = Shop.find(params[:id])
    if @shop.user.id != current_user.id
      flash[:alert] = "権限がありません"
      redirect_to user_path(current_user.id)
    end
  end

  def checked_shop
    if session[:checked_shop_id] != nil
      @checked_shop = Shop.find(session[:checked_shop_id])
    end
  end

  def places
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    @shops = Shop.within_box(0.621, latitude, longitude)
    @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
      marker.lat shop.latitude
      marker.lng shop.longitude
      marker.infowindow render_to_string(partial: "shops/infowindow", locals: { shop: shop })
      marker.picture({
        :url => view_context.image_path('coffee_pin.png'),
        :width   => 32,
        :height  => 32,
       })
    end
  end

  def set_address
    @shop.address = [@shop.prefecture_code,  @shop.address_city, @shop.address_street, @shop.name].compact.join
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :branch, :furigana, :station_name, :other_name, :business_hour, :head_image, :postcode, :prefecture_code, :address_city, :address_street, :address_building,  shop_images_images: [])
  end

  def search_params
    params.require(:q).permit(:sorts, :station_name_or_name_or_furigana_or_other_name_cont)
  end

  def user_shop_post
    @user_shop_post = Post.find_by(user_id: current_user.id, shop_id: @shop.id)
  end

end
