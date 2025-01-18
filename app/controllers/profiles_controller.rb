class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
  end

  def new
    if current_user.profile.present?
      redirect_to profile_path
    else
      @profile = current_user.build_profile
    end
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'プロフィールを作成しました'
    else
      flash.now[:error] = 'プロフィールの作成に失敗しました'
      render :new
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
      flash.now[:error] = 'プロフィールの編集に失敗しました'
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:nickname, :age, :gender, :region, :introduction, :notify_email, :avatar)
  end
end
