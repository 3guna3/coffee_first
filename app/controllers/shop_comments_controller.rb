class ShopCommentsController < ApplicationController
  before_action :authenticate_user!, { only: [:create, :edit, :update, :destroy] }
  before_action :set_shop_comment, { only: [:edit, :update, :destroy, :show] }

  def create
    @shop_comment = current_user.shop_comments.new(shop_comment_params)
    if @shop_comment.save
      redirect_back(fallback_location: root_path, notice: "投稿しました")
    else
      redirect_back(fallback_location: root_path, alert: { error: @shop_comment.errors.full_messages })
    end
  end

  def edit; end

  def update
    @shop_comment.update!(shop_comment_params)
    redirect_to @shop_comment
  end

  def destroy
    @shop_commnet.destroy!
    redirect_to root_path
  end

  def show; end

  private

  def set_shop_comment
    @shop_comment = Shop_Comment.find(params[:id])
  end

  def shop_comment_params
    params.require(:shop_comment).permit(:content, :rate, :user_id, :shop_id)
  end
end
