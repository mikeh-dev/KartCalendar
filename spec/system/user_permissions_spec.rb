require 'rails_helper'

RSpec.describe 'User Permissions', type: :system do
  let(:admin) { FactoryBot.create(:user, :admin) }
  let(:non_admin) { FactoryBot.create(:user) }
  let(:track) { FactoryBot.create(:track) }
  let(:event) { FactoryBot.create(:event) }
  let(:championship) { FactoryBot.create(:championship) }
  let(:another_user) { FactoryBot.create(:user) }

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
      visit tracks_path
      expect(page).not_to have_selector(:link_or_button, 'Edit')
      visit edit_track_path(track)
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'does not allow non-admin to delete a track' do
      visit track_path(track)
      expect(page).not_to have_selector(:link_or_button, 'Delete')
    end

    it 'does not allow non-admin to create an event' do
      visit new_event_path
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'does not allow non-admin to edit an event' do
      visit event_path(event)
      expect(page).not_to have_selector(:link_or_button, 'Edit')
      visit edit_event_path(event)
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'does not allow non-admin to delete an event' do
      visit event_path(event)
      expect(page).not_to have_selector(:link_or_button, 'Delete')
    end

    it 'does not allow a non-admin user to create a championship' do
      visit championships_path
      expect(page).not_to have_selector(:link_or_button, 'New Championship')
      visit new_championship_path
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'does not allow a non-admin user to edit a championship' do
      visit championship_path(championship)
      expect(page).not_to have_selector(:link_or_button, 'Edit')
      visit edit_championship_path(championship)
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'does not allow a non-admin user to delete a championship' do
      visit championship_path(championship)
      expect(page).not_to have_selector(:link_or_button, 'Delete')
    end

  end
end