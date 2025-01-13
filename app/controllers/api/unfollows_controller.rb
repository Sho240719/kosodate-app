class Api::UnfollowsController < Api::ApplicationController
  def create
    current_user.unfollow!((params[:account_id]))
    render json: { status: :unfollowed }
  end
end
