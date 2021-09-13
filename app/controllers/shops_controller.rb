class ShopsController < ApplicationController
  before_action :authenticate_user, { only: [:create] }

  def new
    @shop = Shop.new
  end

  def create; end

  def show; end

  def index
    @shops = Shop.all
  end
end
