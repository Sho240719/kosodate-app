class Api::LikesController < Api::ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = post.likes.build(user: current_user)
    if like.save
      render json: { status: 'liked' }
    else
      render json: { status: 'error' }, status: :unprocessable_entity
    end
  end
end
