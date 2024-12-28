class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    if current_user.profile.present?
      root_path
    else
      new_profile_path
    end
  end
end
