module ProfilesHelper
  # プロフィール画像があれば表示、なければデフォルト画像を表示
  def avatar_display(user, class_name: nil)
    if user.profile&.avatar&.attached?
      image_tag user.profile.avatar, class: class_name
    else
      image_tag 'default_avatar.png', class: class_name
    end
  end
end
