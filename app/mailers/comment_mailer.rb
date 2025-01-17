class CommentMailer < ApplicationMailer
  def add_comment(user, post)
    @user = user
    @post = post
    @recipient = @post.user

    mail to: @recipient.email, subject: '【お知らせ】コメント追加のお知らせ'
  end
end
