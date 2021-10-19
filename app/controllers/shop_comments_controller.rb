class ShopCommentsController < ApplicationController
  before_action :authenticate_user!, { only: [:create, :destroy] }
  before_action :set_shop, { only: [:destroy] }

  def create
    @shop_comment = current_user.shop_comments.new(shop_comment_params)
    if @shop_comment.save
      redirect_back(fallback_location: root_path, notice: "投稿しました")
    else
      redirect_back(fallback_location: root_path, alert: "投稿に失敗しました")
    end
  end

  def destroy
    if current_user.id == @shop_comment.user.id
      @shop_comment.destroy!
      redirect_back(fallback_location: root_path, notice: "コメントを削除しました")
    else
      render "shops/show"
    end
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
    @shop_comment = @shop.shop_comments.find(params[:id])
  end

  def shop_comment_params
    params.require(:shop_comment).permit(:content, :rate, :user_id, :shop_id)
  end
end
