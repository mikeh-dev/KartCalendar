require 'rails_helper'

RSpec.describe "TrackAuth", type: :request do
  describe 'tracks', type: :request do
    let(:user) { create(:user) }
    let(:admin) { create(:user, admin: true) }
    let(:track) { create(:track) }
    let(:manager) { create(:user, role: 'manager') }
  
    it 'denies access for regular users' do
      login_as user
      get track_path(track)
      expect(response).to have_http_status(:success)
      get edit_track_path(track)
      follow_redirect!
      expect(response).to have_http_status(:success)
    end
  
    it 'allows access for admin users' do
      login_as admin
      get track_path(track)
      expect(response).to have_http_status(:success)
      get edit_track_path(track)
      expect(response).to have_http_status(:success)
    end

    it 'allows access for track owners' do
      login_as manager
      get track_path(track)
      expect(response).to have_http_status(:success)
      get edit_track_path(track)
      expect(response).to have_http_status(:redirect)
    end

    it 'denies access for track owners to delete tracks' do
      login_as manager
      delete track_path(track)
      follow_redirect!
      expect(response).to have_http_status(:success)
    end
  end
end