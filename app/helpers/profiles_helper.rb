module ProfilesHelper
  # プロフィール画像があれば表示、なければデフォルト画像を表示
  def avatar_display(user)
    if user.profile&.avatar&.attached?
      image_tag user.profile.avatar, class: 'avatar-icon'
    else
      image_tag 'default_avatar.png', class: 'avatar-icon'
    end
  end
end
