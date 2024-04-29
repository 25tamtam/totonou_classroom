class PostCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:create]
  before_action :set_post_comment, only: [:show]
  
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
    @comment = PostComment.find(params[:id])
    unless current_user.admin? || @comment.user == current_user
    redirect_to root_path, alert: 'このコメントの詳細を見る権限がありません。'
    end
  end


  private

  def comment_params
    params.require(:post_comment).permit(:body).merge(user_id: current_user.id)
  end

  def check_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def set_post_comment
    @comment = PostComment.find(params[:id])
  end
end
