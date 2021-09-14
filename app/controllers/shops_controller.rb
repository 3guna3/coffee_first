class ShopsController < ApplicationController
  before_action :authenticate_user!, { only: [:new, :create] }

  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.shops.new(shop_params)
    if @shop.save
      redirect_to @shop, notice: "登録しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
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
