class UsersController < ApplicationController
  before_action :set_user, { only: [:show, :hide] }
  def show
    @shops = Shop.where(user_id: @user.id)
    @beans = Bean.where(user_id: @user.id)
  end

  def hide
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "ご利用いただきありがとうございました。"
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
