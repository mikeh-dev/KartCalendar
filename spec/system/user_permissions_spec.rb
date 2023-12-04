require 'rails_helper'

RSpec.describe 'User Permissions', type: :system do
  let(:admin) { FactoryBot.create(:user, :admin) }
  let(:non_admin) { FactoryBot.create(:user) }
  let(:track) { FactoryBot.create(:track) }
  let(:event) { FactoryBot.create(:event) }

  before do
    login_as(non_admin, scope: :user)
  end

  context 'when a non admin user is logged in' do

    it 'does not allow non-admin to create a track' do
      visit new_track_path
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'does not allow non-admin to edit a track' do
      visit edit_track_path(track)
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'does not allow non-admin to delete a track' do
      visit track_path(track)
      expect(page).not_to have_selector(:link_or_button, 'Delete')
    end

    it 'does not allow a non-admin user to see an Edit Track Button on track index' do
      visit tracks_path
      expect(page).not_to have_content("Edit track")
    end
  end
end