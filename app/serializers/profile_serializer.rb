class ProfileSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :nickname, :avatar_image_url

  def avatar_image_url
    if object.avatar.attached?
      url_for(object.avatar)
    else
      ActionController::Base.helpers.asset_path('default_avatar.png')
    end
  end
end
