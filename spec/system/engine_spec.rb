require 'rails_helper'

RSpec.describe 'Engines', type: :system do
  let(:user) { create(:user) }
  let(:admin) { create(:user, :admin) }
  let!(:engine) { create(:engine, user: user) }

  describe 'Access Control' do
    context 'when logged in as a user' do
      before do
        login_as(user, scope: :user)
      end

      it 'allows the user to view their own engine' do
        visit engine_path(engine)
        expect(page).to have_content(engine.name)
      end

      it 'allows the user to edit their own engine' do
        visit edit_engine_path(engine)
        expect(page).to have_content('Edit Engine')
      end
    end

    context 'when logged in as an admin' do
      before do
        login_as(admin, scope: :user)
      end

      it 'allows the admin to view any engine' do
        visit engine_path(engine)
        expect(page).to have_content(engine.name)
      end

      it 'allows the admin to edit any engine' do
        visit edit_engine_path(engine)
        expect(page).to have_content('Edit Engine')
      end

      it 'allows the admin to delete the engine' do
        visit engine_path(engine)
        expect(page).to have_link('Delete Engine')
        accept_confirm do
          click_link 'Delete Engine'
        end
        expect(page).to have_content("Engine deleted successfully")
      end
    end
  end

  
end
