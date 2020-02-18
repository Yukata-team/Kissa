class PostsController < ApplicationController
  def new
    @post = Post.new
    @post.shop_id = params[:id]
  end
  def create
    @post = Post.new(post_params)
    @post.shop_id = params[:id]
    @post.user_id = current_user.id
    @post.post_total_point = (@post.congestion + @post.menu + @post.price + @post.wifi + @post.others) / 5
    if @post.save
      redirect_to shops_search_path
    else
      render :new
    end
  end
  private
  def post_params
    params.require(:post).permit(:congestion, :menu, :price, :wifi, :others, :review)
  end
end
