class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    post_ids = current_user.likes.pluck(:post_id)
    @posts = Post.where(id: post_ids).order(created_at: :desc)
  end
end
