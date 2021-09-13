class ShopsController < ApplicationController
  before_action :authenticate_user, { only: [:create] }

  def new
    @shop = Shop.new
  end

  def create
    Shop.create!(name: shop_params[:name], prefecture: shop_params[:prefecture], address: shop_params[:address], TEL: shop_params[:TEL], HP: shop_params[:HP],
                 img: shop_params[:img], user_id: current_user.id)
  end

  def show; end

  def index
    @shops = Shop.all
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :prefecture, :address, :TEL, :HP, :img)
  end
end
