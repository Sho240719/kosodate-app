class Api::LikesController < Api::ApplicationController
  def show
    post = Post.find(params[:post_id])
    liked = current_user.likes.exists?(post_id: post.id)
    render json: { hasLiked: liked }
  end

  def create
    post = Post.find(params[:post_id])
    like = post.likes.build(user: current_user)
    if like.save
      render json: { status: true }
    else
      render json: { status: 'error' }, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    like = post.likes.find_by(user: current_user)
    if like.destroy
      render json: { status: false }
    else
      render json: { status: 'error' }, status: :unprocessable_entity
    end
  end
end
