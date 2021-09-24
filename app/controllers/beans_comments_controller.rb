class BeansCommentsController < ApplicationController
  before_action :authenticate_user!, { only: [:create, :edit, :update, :destroy] }
  before_action :set_beans_comment, { only: [:edit, :update, :destroy, :show] }

  def create
    @beans_comment = current_user.beans_comments.new(beans_comment_params)
    if @beans_comment.save
      redirect_back(fallback_location: root_path, notice: "投稿しました")
    else
      flash.now[:alert] = "投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  def edit; end

  def update
    @beans_comment.update!(beans_comment_params)
    redirect_to @beans_comment
  end

  def destroy
    @beans_commnet.destroy!
    redirect_to root_path
  end

  def show; end

  private

  def set_beans_comment
    @beans_comment = Beans_Comment.find(params[:id])
  end

  def beans_comment_params
    params.require(:beans_comment).permit(:content, :bitterness, :acidity, :body, :user_id, :bean_id)
  end
end
