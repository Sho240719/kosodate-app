module ProfilesHelper
  # プロフィール画像があれば表示、なければデフォルト画像を表示
  def avatar_display(user, class_name: nil)
    if user.profile&.avatar&.attached?
      image_tag user.profile.avatar, class: class_name
    else
      image_tag 'default_avatar.png', class: class_name
    end
  end

  def age_display(user)
    user.profile.age.present? ? "年齢：#{user.profile.age}歳" : '年齢：未入力'
  end

  def gender_display(user)
    user.profile.gender.present? ? "性別：#{user.profile.gender}" : '性別：未入力'
  end

  def region_display(user)
    user.profile.region.present? ? "地域：#{user.profile.region}" : '地域：未入力'
  end
end
