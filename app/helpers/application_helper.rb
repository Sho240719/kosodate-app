module ApplicationHelper
  def login_logout_link
    if user_signed_in?
      link_to "ログアウト", '#', class: "header-nav-link"
    else
      link_to 'ログイン', '#', class: 'header-nav-link'
    end
  end
end
