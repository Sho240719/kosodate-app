class Api::FollowsController < Api::ApplicationController
  def create
    current_user.follow!((params[:account_id]))
    render json: { status: :followed }
  end
end
