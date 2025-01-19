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

require 'rails_helper'

RSpec.describe Profile, type: :model do
  let!(:user) { create(:user) }

  context '名前を入力している場合' do
    let!(:profile) { build(:profile, user: user) }

    it 'プロフィールを保存できる' do
      expect(profile).to be_valid
    end
  end

  context '名前を入力してない場合' do
    let!(:profile) { build(:profile, nickname: nil, user: user) }

    before do
      profile.save
    end

    it 'プロフィールを保存できない' do
      expect(profile.errors.messages[:nickname][0]).to eq('を入力してください')
    end
  end

  context '同じ名前のユーザーがいる場合' do
    let(:profileA) { build(:profile, nickname: 'AAA', user: user) }
    let(:profileB) { build(:profile, nickname: 'AAA', user: user) }

    before do
      profileA.save
      profileB.save
    end

    it 'プロフィールを保存できない' do
      expect(profileB.errors.messages[:nickname][0]).to eq('はすでに存在します')
    end
  end
end
