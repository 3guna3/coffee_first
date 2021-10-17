class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @shops = Shop.where(user_id: @user.id)
    @beans = Bean.where(user_id: @user.id)
  end
end
