class ShopsController < ApplicationController
  before_action :authenticate_user!, { only: [:new, :create] }

  def new
    @shop = Shop.new
  end

  def create
    current_user.shops.create!(shop_params)
  end

  def show; end

  def index
    @shops = Shop.all
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :prefecture, :address, :TEL, :URL, :img)
  end
end
