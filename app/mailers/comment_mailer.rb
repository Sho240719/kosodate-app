class CommentMailer < ApplicationMailer
  def add_comment(user, post)
    @user = user
    @post = post
    mail to: user.email, subject: '【お知らせ】コメント追加のお知らせ'
  end
end
