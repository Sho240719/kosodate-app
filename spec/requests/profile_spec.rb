require 'rails_helper'

RSpec.describe 'Profile', type: :request do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }

  before do
    sign_in user
  end

  describe 'GET /profile' do
    context 'ログインしている場合' do
      context 'showアクション' do
        it '200ステータスが返ってくる' do
          get profile_path
          expect(response).to have_http_status(200)
        end
      end

      context 'newアクション' do
        it '302ステータスが返ってくる' do
          get new_profile_path
          expect(response).to have_http_status(302)
        end
      end
    end
  end
end
