class PostsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :destroy]

  def new
    @post = Post.new
    @post.shop_id = params[:id]
  end

  def create
    @post = Post.new(post_params)
    @post.shop_id = params[:id]
    @post.user_id = current_user.id
    @post.post_total_point = (@post.congestion.to_f + @post.menu.to_f + @post.price.to_f + @post.wifi.to_f + @post.others.to_f) / 5
    if @post.save
      redirect_to shops_search_path, notice: "レビューを投稿しました"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      @post.post_total_point = (@post.congestion.to_f + @post.menu.to_f + @post.price.to_f + @post.wifi.to_f + @post.others.to_f) / 5
      @post.save
      redirect_to user_path(@post.user.id), notice: "変更を保存しました"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(@post.user.id), notice: "レビューを削除しました"
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    if @post.user.id != current_user.id
      flash[:alert] = "権限がありません"
      redirect_to user_path(current_user.id)
    end
  end

  private
  def post_params
    params.require(:post).permit(:congestion, :menu, :price, :wifi, :others, :review)
  end

end
