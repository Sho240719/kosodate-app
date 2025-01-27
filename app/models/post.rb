# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string(255)      not null
#  category   :integer          not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  enum category: { worry: 0, daily: 1, friend: 2 }

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 100 }
  validates :category, presence: true
  validate :validate_prohibited_words

  private
  def validate_prohibited_words
    prohibited_words = [ "あああ" ]
    return if content.blank?

    if prohibited_words.any? { |word| content.include?(word) }
      errors.add(:content, 'に不適切な文字が含まれています')
    end
  end
end
