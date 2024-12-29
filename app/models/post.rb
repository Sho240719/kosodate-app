# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 100 }
  validate :validate_prohibited_words

  private
  def validate_prohibited_words
    prohibited_words = [ "xx", "yy" ]
    return if content.blank?

    if prohibited_words.any? { |word| content.include?(word) }
      errors.add(:content, 'に不適切な文字が含まれています。')
    end
  end
end
