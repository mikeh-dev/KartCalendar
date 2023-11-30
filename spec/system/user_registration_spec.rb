require 'rails_helper'

RSpec.describe 'User Registration', type: :system do
  let(:user) { FactoryBot.build(:user) }

  it 'allows a user to register with acceptable details' do
    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(User.exists?(email: user.email )).to be true
  end


   it 'does not allow a user to register with unacceptable email' do
    visit new_user_registration_path

    fill_in 'Email', with: 'test@email'
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password

    click_button 'Sign up'

    expect(page).to have_content('Email is invalid')
    expect(User.exists?(email: 'test@email')).to be false
   end

   it 'does not allow a user to register with unacceptable first name' do
    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'First name', with: 'a'
    fill_in 'Last name', with: user.last_name
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password

    click_button 'Sign up'

    expect(page).to have_current_path(new_user_registration_path)
    expect(User.exists?(first_name: 'a', email: user.email)).to be false
   end

   it 'does not allow a user to register with unacceptable last name' do
    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: 'a'
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password

    click_button 'Sign up'

    expect(page).to have_current_path(new_user_registration_path)
    expect(User.exists?(last_name: 'a', email: user.email)).to be false
   end

  it 'does not allow a user to register with unacceptable password' do
    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Password', with: '123'
    fill_in 'Password confirmation', with: '123'

    click_button 'Sign up'

    expect(page).to have_content('Password is too short (minimum is 6 characters)')
    expect(User.exists?(email: user.email)).to be false
   end

   it 'does not allow a user to register with unacceptable password confirmation' do
    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: '123'

    click_button 'Sign up'

    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(User.exists?(email: user.email)).to be false
   end
end