
require 'rails_helper'

RSpec.describe 'User Sign In', type: :system do
  let(:user) { FactoryBot.create(:user) }

  it 'allows a user to sign in' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_current_path(root_path)
  end

  it 'displays an error message with invalid credentials' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrong_password'

    click_button 'Sign in'

    expect(page).to have_content('Invalid Email or password.')
    expect(page).to have_current_path(new_user_session_path)
  end

  it 'displays an error message with invalid email' do
    visit new_user_session_path

    fill_in 'Email', with: 'wrong@email.com'
    fill_in 'Password', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('Invalid Email or password.')
    expect(page).to have_current_path(new_user_session_path)
  end
end
