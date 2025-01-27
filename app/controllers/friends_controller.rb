class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    posts = Post.all
    @friend_posts = posts.where(category: :friend).order(created_at: :desc)
  end
end
