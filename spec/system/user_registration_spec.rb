require 'rails_helper'

RSpec.describe 'User Registration', type: :system do

  it 'allows a user to register' do
    visit new_user_registration_path

    fill_in 'Email', with: 'test@example.com'
    fill_in 'First name', with: 'Test'
    fill_in 'Last name', with: 'User'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end