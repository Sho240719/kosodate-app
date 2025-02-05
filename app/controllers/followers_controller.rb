class FollowersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:account_id])
    @followers = @user.followers

    render json: { follower_count: @followers.count }
  end
end
