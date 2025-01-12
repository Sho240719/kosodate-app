module ApplicationHelper
  def header_navigation_links
    if user_signed_in?
      safe_join([
        link_to("投稿一覧", posts_path, data: { turbo: false }, class: "header-nav-link"),
        link_to("プロフィール", profile_path, class: "header-nav-link"),
        link_to("ログアウト", destroy_user_session_path, data: {turbo_method: :delete, turbo_confirm: 'ログアウトしますか？'}, class: "header-nav-link")
      ], "\n") # 各リンクを改行
    else
      link_to 'ログイン', new_user_session_path, class: 'header-nav-link'
    end
  end
end
