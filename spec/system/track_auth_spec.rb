require 'rails_helper'

RSpec.describe "TrackAuth", type: :system do

  let(:user) { create(:user) }
  let(:admin) { create(:user, admin: true) }
  let(:track) { create(:track) }
  let(:manager) { create(:user, role: 'manager') }
  let(:track2) { create(:track, user: manager) }

  context 'as a regular user' do
    before do
      login_as user
    end

    it 'denies access to edit any tracks' do
      visit edit_track_path(track)
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'denies access to delete any tracks' do
      visit track_path(track)
      expect(page).not_to have_link('Delete Track')
    end

    it 'denies access to create any tracks' do
      visit new_track_path
      expect(page).to have_content('You are not authorized to perform this action.')
    end
  end

  context 'as an admin user' do
    before do
      login_as admin
    end

    it 'allows access to edit any tracks' do
      visit edit_track_path(track)
      expect(page).to have_content('Edit Track')
    end

    it 'allows access to delete any tracks' do
      visit edit_track_path(track)
      expect(page).to have_link('Delete Track')
    end

    it 'allows access to create any tracks' do
      visit new_track_path
      expect(page).to have_content('New Track')
    end
  end

  context 'as a manager user' do
    before do
      login_as manager
    end

    it 'denies access to edit any tracks' do
      visit edit_track_path(track)
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'denies access to delete any tracks' do
      visit track_path(track)
      expect(page).not_to have_link('Delete Track')
    end

    it 'denies access to create any tracks' do
      visit new_track_path
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'allows access to edit their own tracks' do
      visit edit_track_path(track2)
      expect(page).to have_content('Edit Track')
    end
  end
end