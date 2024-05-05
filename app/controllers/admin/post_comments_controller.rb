# 管理者
# /app/controllers/admin/post_comments_controller.rb

class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:create, :edit, :update]
  before_action :set_post_comment, only: [:show, :edit, :update]
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.post_comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post), notice: 'コメントが正常に投稿されました。'
    else
      redirect_to @post, alert: 'コメントの投稿に失敗しました。'
    end
  end

  def show
    unless current_user.admin? || @comment.user == current_user
      redirect_to root_path, alert: 'このコメントの詳細を見る権限がありません。'
    end
  end

  def edit
     @post_comment = PostComment.find(params[:id])
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post), notice: 'コメントが正常に更新されました。'
    else
      render :edit, alert: 'コメントの更新に失敗しました。'
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:body)
  end

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: '管理者のみがコメントを編集できます。'
    end
  end

  def set_post_comment
    @comment = PostComment.find(params[:id])
  end
end