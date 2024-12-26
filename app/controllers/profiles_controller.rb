class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'プロフィールを作成しました'
    else
      render :new, alert: 'プロフィールの作成に失敗しました'
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:nickname, :age, :gender, :region, :introduction)
  end
end
