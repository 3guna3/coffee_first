class BeansCommentsController < ApplicationController
  before_action :authenticate_user!, { only: [:create, :edit, :update, :destroy] }
  before_action :set_beans, { only: [:destroy] }

  def create
    @beans_comment = current_user.beans_comments.new(beans_comment_params)
    if @beans_comment.save
      redirect_back(fallback_location: root_path, notice: "投稿しました")
    else
      redirect_back(fallback_location: root_path, alert: "投稿に失敗しました")
    end
  end

  def edit; end

  def update
    @beans_comment.update!(beans_comment_params)
    redirect_to @beans_comment
  end

  def destroy
    if current_user.id == @beans_comment.user.id
      @beans_comment.destroy!
      redirect_back(fallback_location: root_path)
    else
      render "beans/show"
    end
  end

  def show; end

  private

  def set_beans
    @bean = Bean.find(params[:bean_id])
    @beans_comment = @bean.beans_comments.find(params[:id])
  end

  def beans_comment_params
    params.require(:beans_comment).permit(:content, :bitterness, :acidity, :body, :user_id, :bean_id)
  end
end
