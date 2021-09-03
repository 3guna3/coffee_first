class ShopCommentsController < ApplicationController
  before_action :authenticate_user, { only: [:create, :edit, :update, :destroy] }
  def create; end

  def edit; end

  def update; end

  def destroy; end

  def show; end
end
