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

require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { create(:user) }

  context '投稿内容が入力されている場合' do
    let!(:post) { build(:post, user: user) }

    it 'ポストを保存できる' do
      expect(post).to be_valid
    end
  end

  context '投稿内容が101文字以上の場合' do
    let!(:post) { build(:post, content: Faker::Lorem.characters(number: 101), user: user) }

    before do
      post.save
    end

    it 'ポストを保存できない' do
      expect(post.errors.messages[:content][0]).to eq('は100文字以内で入力してください')
    end
  end

  context '投稿内容が空の場合' do
    let(:post) { build(:post, content: nil, user: user) }

    before do
      post.save
    end

    it 'ポストを保存できない' do
      expect(post.errors.messages[:content][0]).to eq('を入力してください')
    end
  end

  context '投稿内容に不適切な語句が入っている場合' do
    let(:post) { build(:post, content: '私はあああです', user: user) }

    before do
      post.save
    end

    it 'ポストを保存できない' do
      expect(post.errors.messages[:content][0]).to eq('に不適切な文字が含まれています')
    end
  end
end
