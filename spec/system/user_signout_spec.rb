require 'rails_helper'

RSpec.describe 'User Sign Out', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
   login_as user
  end

  context 'when user is signed in' do
    it 'allows user to sign out' do
      visit root_path
      find("#dropdowns-nav-toggle").click
      find("#profile-button").click
      click_button 'Sign out'
      expect(page).to have_content('Signed out successfully.')
      expect(page).to have_current_path(root_path)
    end
  end
end