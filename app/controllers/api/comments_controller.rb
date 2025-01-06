class Api::CommentsController < Api::ApplicationController
  include ProfilesHelper # ヘルパーメソッドをコントローラーで利用可能にする

  def index
    post = Post.find(params[:post_id])
    comments = post.comments.includes(user: :profile)

    render json: comments.map { |comment|
      {
        id: comment.id,
        content: comment.content,
        created_at: comment.created_at.strftime('%Y-%m-%d'), # フォーマットを指定
        user: {
          profile: {
            nickname: comment.user.profile.nickname,
            avatar_image_url: avatar_url(comment.user.profile)
          }
        }
      }
    }
  end
end
