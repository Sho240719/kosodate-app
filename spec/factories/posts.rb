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
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

FactoryBot.define do
  factory :post do
    content { Faker::Lorem.characters(number: 100) }
  end
end
