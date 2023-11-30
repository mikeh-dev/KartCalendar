require 'rails_helper'

RSpec.describe 'User Registration', type: :system do

  it 'allows a user to register with acceptable details' do
    visit new_user_registration_path

    user = FactoryBot.build(:user)

    fill_in 'Email', with: user.email
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(User.exists?(email: user.email )).to be true
  end


   it 'does not allow a user to register with unacceptable details' do
    visit new_user_registration_path

    fill_in 'Email', with: 'kasdkjasd@asdasd'
    fill_in 'First name', with: 'aaa'
    fill_in 'Last name', with: 'User'

    click_button 'Sign up'

    expect(page).to have_content('Email is invalid')
    expect(User.exists?(email: 'kasdkjasd')).to be false
   end

end