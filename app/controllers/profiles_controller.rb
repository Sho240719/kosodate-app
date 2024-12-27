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

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to profile_path, notice: 'プロフィールを編集しました'
    else
      render :edit, alert: 'プロフィールの編集に失敗しました'
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:nickname, :age, :gender, :region, :introduction, :avatar)
  end
end
