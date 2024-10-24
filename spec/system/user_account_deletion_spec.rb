require 'rails_helper'

RSpec.describe 'User account cancellation', type: :system do
  let(:user) { FactoryBot.create(:user) }

  context 'when a user is signed in' do

    it 'allows a user to cancel their account' do
      login_as user
      visit root_path
      if page.has_css?('#dropdowns-nav-toggle', visible: true)
        find('#dropdowns-nav-toggle').click
      end

      find("#profile-button").click

      click_link 'Edit account'

      accept_confirm do
        click_button 'Cancel account'
      end

      expect(page).to have_content('Your account has been successfully cancelled')
      expect(current_path).to eq root_path
      expect { user.reload }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
