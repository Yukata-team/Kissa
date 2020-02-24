class PostsController < ApplicationController

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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(@post.user.id), notice: "レビューを削除しました"
  end

  private
  def post_params
    params.require(:post).permit(:congestion, :menu, :price, :wifi, :others, :review)
  end

end
