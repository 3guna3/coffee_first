class ShopsController < ApplicationController
  before_action :authenticate_user!, { except: [:index, :show] }
  before_action :set_shop, { only: [:show, :edit, :update, :destroy] }

  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.shops.new(shop_params)
    if @shop.save
      redirect_to root_path, notice: "登録しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def edit; end

  def update
    @shop.update!(shop_params)
    redirect_to @shop
  end

  def destroy
    @shop.destroy!
    redirect_to root_path
  end

  def show; end

  def index
    @shops = Shop.order(:created_at)
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :prefecture, :address, :TEL, :URL, :img, :user_id)
  end
end
