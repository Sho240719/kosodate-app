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

FactoryBot.define do
  factory :profile do
    nickname { Faker::Name.name }
  end
end
