class ProfileSerializer < ActiveModel::Serializer
  include ProfilesHelper

  attributes :nickname, :avatar_image_url

  def avatar_image_url
    avatar_url(object)
  end
end
