class ShopsController < ApplicationController
  def index
    @q = Shop.ransack(params[:q])
    @shop = @q.result
  end
end
