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

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  context 'コメントが入力されている場合' do
    let!(:comment) { build(:comment, user: user, post: post) }

    it 'コメントを保存できる' do
      expect(comment).to be_valid
    end
  end

  context 'コメントが入力されていない場合' do
    let!(:comment) { build(:comment, content: nil, user: user, post: post) }

    before do
      comment.save
    end

    it 'コメントを保存できない' do
      expect(comment.errors.messages[:content][0]).to eq('を入力してください')
    end
  end

  context 'コメントが31文字以上の場合' do
    let!(:comment) { build(:comment, content: Faker::Lorem.characters(number: 31), user: user, post: post )}

    before do
      comment.save
    end

    it 'コメントを保存できない' do
      expect(comment.errors.messages[:content][0]).to eq('は30文字以内で入力してください')
    end
  end
end
