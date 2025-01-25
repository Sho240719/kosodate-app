class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.includes(user: :profile).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: 'ポストを投稿しました'
    else
      flash.now[:error] = 'ポストの投稿に失敗しました'
      render :new
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
