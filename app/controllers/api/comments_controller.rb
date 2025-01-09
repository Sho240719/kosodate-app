class Api::CommentsController < Api::ApplicationController
  def index
    post = Post.find(params[:post_id])
    comments = post.comments.eager_load(user: :profile)
    render json: comments, include: ['user.profile']
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.build(comment_params.merge(user: current_user))
    if comment.save
      render json: comment, include: ['user.profile'], status: :created
    else
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.destroy!

    head :no_content
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
