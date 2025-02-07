# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  content    :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true, length: { maximum: 30 }

  after_create :send_email

  private

  def send_email
    return if Rails.env.production?

    recipient = post.user

    return if user == recipient || !recipient.profile.notify_email

    CommentMailer.add_comment(self, recipient).deliver_later
  end
end
