# app/controllers/posts_controller.rb

class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # ユーザーが投稿したすべての投稿を一覧表示するアクション
  def index
    @user_posts = current_user.posts
  end

  # 新しい投稿フォームを表示するアクション
  def new
    @post = current_user.posts.build
  end
  
  # 新しい投稿を作成するアクション
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: '投稿が正常に作成されました。'
    else
      render :new
    end
  end

  # 投稿の詳細を表示するアクション
  def show
    @post = Post.find(params[:id])
    if current_user.admin? || current_user == @post.user
      @comments = @post.post_comments
    else
      @comments = []
    end
  end

  # 投稿の編集フォームを表示するアクション
  def edit
    @post = current_user.posts.find(params[:id])
  end

  # 投稿の更新を行うアクション
  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: '投稿が正常に更新されました。'
    else
      render :edit
    end
  end

  # 投稿を削除するアクション
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: '投稿が正常に削除されました。'
  end

  private

  # ストロングパラメーター
  def post_params
    params.require(:post).permit(:title, :age, :detail, :image1, :image2, :advice).merge(user_id: current_user.id)
  end
end
