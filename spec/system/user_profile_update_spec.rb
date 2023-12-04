require 'rails_helper'

RSpec.describe 'User Profile Update', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as user
  end

  context 'when user is signed in' do
    it 'allows user to update profile' do
      visit root_path
      find("#dropdowns-nav-toggle").click
      find("#profile-button").click
      click_link 'Edit account'
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Current password', with: user.password
      click_button 'Update'
      expect(page).to have_content('Your account has been updated successfully.')
      expect(user.reload.email).to eq('test@email.com')
    end


    it 'does not allow user to update profile with invalid email' do
      visit root_path
      find("#dropdowns-nav-toggle").click
      find("#profile-button").click
      click_link 'Edit account'
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Current password', with: 'wrong_password'
      click_button 'Update'
      expect(page).to have_content('Current password is invalid')
    end

    it 'does not allow user to update with an invalid email' do
      visit root_path
      find("#dropdowns-nav-toggle").click
      find("#profile-button").click
      click_link 'Edit account'
      fill_in 'Email', with: 'test'
      fill_in 'Current password', with: user.password
      click_button 'Update'
      expect(user.reload.email).not_to eq('invalidemail')
    end

  end
end