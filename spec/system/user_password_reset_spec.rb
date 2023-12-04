require 'rails_helper'

RSpec.describe 'PasswordReset', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as user
  end

  context 'when user is signed in' do
    it 'allows a user to change their password' do
      visit root_path
      find("#dropdowns-nav-toggle").click
      find("#profile-button").click
      click_link 'Edit account'
      fill_in 'Password', with: 'newpassword'
      fill_in 'Password confirmation', with: 'newpassword'
      fill_in 'Current password', with: user.password
      click_button 'Update'
      expect(page).to have_content('Your account has been updated successfully.')
    end
  end 
end