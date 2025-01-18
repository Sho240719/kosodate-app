class CommentMailer < ApplicationMailer
  def add_comment(comment, recipient)
    @user = comment.user
    @post = comment.post

    mail to: recipient.email, subject: '【お知らせ】コメント追加のお知らせ'
  end
end
