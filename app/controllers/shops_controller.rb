class ShopsController < ApplicationController
  before_action :authenticate_user!, { except: [:index] }
  before_action :set_shop, { only: [:show, :edit, :update, :destroy] }
  before_action :set_shop_q, { only: [:index] }

  PER_PAGE = 9

  def index
    if params[:q].present?
      @shops = @q.result.page(params[:page]).per(PER_PAGE)
    else
      params[:q] = { sorts: "created_at desc" }
      @shops = Shop.includes(:user).order(:created_at).page(params[:page]).per(PER_PAGE)
    end
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.shops.new(shop_params)
    @shop.img = "default.cafe.jpg"
    if @shop.save

    else
      redirect_to shops_path, notice: "登録しました"
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def show
    @beans = Bean.where(shop_id: @shop.id)
    @shop_comments = @shop.shop_comments
    @shop_comment = current_user.shop_comments.new
    @average_rate = if @shop.shop_comments.blank?
                      0
                    else
                      @shop.shop_comments.average(:rate).round(2)
                    end
  end

  def edit; end

  def update
    @shop.update!(shop_params)
    redirect_to @shop, notice: "店舗情報を更新しました"
  end

  def destroy
    @shop.destroy!
    redirect_to shops_path, notice: "削除しました"
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
