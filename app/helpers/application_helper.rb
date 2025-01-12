module ApplicationHelper
  def login_logout_link
    if user_signed_in?
      link_to "ログアウト", destroy_user_session_path, data: {turbo_method: :delete, turbo_confirm: 'ログアウトしますか？'}, class: "header-nav-link"
    else
      link_to 'ログイン', new_user_session_path, class: 'header-nav-link'
    end
  end
end
