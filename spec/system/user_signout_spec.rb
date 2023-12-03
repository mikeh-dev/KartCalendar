require 'rails_helper'

RSpec.describe 'User Sign Out', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
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