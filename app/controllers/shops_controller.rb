class ShopsController < ApplicationController
  before_action :authenticate_user, { only: [:create] }

  def create; end

  def show; end

  def index; end
end
