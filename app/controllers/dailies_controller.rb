class DailiesController < ApplicationController
  before_action :authenticate_user!

  def index
    posts = Post.all
    @daily_posts = posts.where(category: :daily).order(created_at: :desc)
  end
end
