class BeansController < ApplicationController
  before_action :authenticate_user!, { except: [:index] }
  before_action :set_bean, { only: [:show, :edit, :update, :destroy] }
  before_action :set_bean_q, { only: [:index] }

  PER_PAGE = 9

  def index
    if params[:q].present?
      @beans = @q.result.page(params[:page]).per(PER_PAGE)
    else
      params[:q] = { sorts: "created_at desc" }
      @beans = Bean.includes(:user).order(:created_at).page(params[:page]).per(PER_PAGE)
    end
  end

  def new
    @bean = Bean.new
  end

  def create
    @bean = current_user.beans.new(bean_params)
    if @bean.save
      redirect_to root_path, notice: "登録しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def show
    @bean_comments = @bean.beans_comments
    @bean_comment = current_user.beans_comments.new
  end

  def edit; end

  def update
    @bean.update!(bean_params)
    redirect_to @bean, notice: "コーヒー豆の情報を更新しました"
  end

  def destroy
    @bean.destroy!
    redirect_to root_path
  end

  private

  def set_bean
    @bean = Bean.find(params[:id])
  end

  def bean_params
    params.require(:bean).permit(:name, :price, :country, :farm, :variety, :screen_size, :img, :user_id, :shop_id)
  end

  def set_bean_q
    @q = Bean.ransack(params[:q])
  end
end
