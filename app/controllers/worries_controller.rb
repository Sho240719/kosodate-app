class WorriesController < ApplicationController
  before_action :authenticate_user!

  def index
    posts = Post.all
    @worry_posts = posts.where(category: :worry).order(created_at: :desc)
  end
end
