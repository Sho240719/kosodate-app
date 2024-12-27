# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  nickname     :string(255)      not null
#  age          :integer
#  gender       :integer
#  region       :string(255)
#  introduction :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

class Profile < ApplicationRecord
  belongs_to :user

  enum gender: { 男性: 0, 女性: 1 }

  validates :nickname, presence: true, length: { maximum: 10 }, uniqueness: { case_sensitive: false }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_nil: true
  validates :gender, inclusion: { in: genders.keys }, allow_nil: true
  validates :introduction, length: { maximum: 100, minimum: 5 }, allow_nil: true

  has_one_attached :avatar
end
