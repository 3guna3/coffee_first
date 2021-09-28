class ShopsController < ApplicationController
  before_action :authenticate_user!, { except: [:index, :show] }
  before_action :set_shop, { only: [:show, :edit, :update, :destroy] }
  before_action :set_shop_q, { only: [:index, :search] }
  def index
    @shops = Shop.includes(:user).order(:created_at)
  end

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

  def show
    @beans = Bean.where(shop_id: @shop.id)
    @shop_comments = ShopComment.where(shop_id: @shop.id)
    @shop_comment = current_user.shop_comments.new
    @average_rate = if @shop.shop_comments.blank?
                      0
                    else
                      @shop.shop_comments.average(:rate).round(2)
                    end
  end

  def search
    @results = @q.result
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

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :prefecture, :address, :TEL, :URL, :img, :user_id)
  end

  def set_shop_q
    @q = Shop.ransack(params[:q])
  end
end
