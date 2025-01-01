class Api::CommentsController < Api::ApplicationController
  def index
    post = Post.find(params[:post_id])
    comments = post.comments
    render json: comments, status: :ok
  end
end
