require 'rails_helper'

RSpec.describe 'User Dashboard Access', type: :system do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  context 'when a non admin user is logged in' do
    it 'allows a user to access their dashboard' do
      visit root_path
      find("#dropdowns-nav-toggle").click
      click_link 'My Dashboard'

      expect(page).to have_content('User Dashboard')
    end
  end
end
