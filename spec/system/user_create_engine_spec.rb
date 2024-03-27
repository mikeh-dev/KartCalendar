require 'rails_helper'

RSpec.describe 'Engine Permissions', type: :system do
  
  let(:non_admin) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:user, :admin) }
  let(:another_user) { FactoryBot.create(:user) }
  let(:engine) { FactoryBot.create(:engine, user: non_admin) }
  let(:engine2) { FactoryBot.create(:engine, user: another_user) }

  context 'when a user is not logged in' do
    it 'does not allow engine creation unless logged in' do
      visit new_engine_path
      expect(page).to have_current_path(new_user_session_path)
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end

    it 'does not allow engine editing unless logged in' do
      visit edit_engine_path(engine)
      expect(page).to have_current_path(new_user_session_path)
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end

    it 'does not allow engine deletion unless logged in' do
      visit engine_path(engine)
      expect(page).not_to have_selector(:link_or_button, 'Delete')
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end

    it 'does not allow engine viewing unless logged in' do 
      visit engines_path
      expect(page).to have_current_path(new_user_session_path)
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end

  context 'when a non admin user is logged in' do
    before do 
      login_as(non_admin, scope: :user)
      engine
      engine2
    end

    it 'allows a non admin user to create an engine' do
      visit dashboard_index_path
      expect(page).to have_selector(:link_or_button, 'Add Engine')
      click_on 'Add Engine'
      expect(page).to have_current_path(new_engine_path)
      fill_in 'Name', with: 'New Engine'
      fill_in 'Engine make', with: 'New Engine Make'
      fill_in 'Engine model', with: 'New Engine Model'
      fill_in 'Year manufactured', with: '2021'
      fill_in 'Engine number', with: '123456'
      fill_in 'Barrel number', with: '123456'
      fill_in 'Seal number', with: '123456'
      fill_in 'Notes', with: 'New Engine Notes'
      click_on 'Save Engine'
      expect(page).to have_content('Engine added successfully')
      expect(page).to have_current_path(engine_path(Engine.last))
      expect { visit engine_path(engine) }.to change { Engine.count }.by(1)
    end

    it 'allows a non admin user to edit their own engine' do
      visit engine_path(engine)
      expect(page).to have_current_path(engine_path(engine))
      expect(page).to have_selector(:link_or_button, 'Edit Engine')
      click_on 'Edit Engine'
      expect(page).to have_current_path(edit_engine_path(engine))
    end

    it 'allows a non admin user to delete their own engine' do
      visit engine_path(engine)
      expect(page).to have_selector(:link_or_button, 'Delete Engine')
      expect {
        accept_confirm do
          click_on 'Delete Engine'
        end
        expect(page).to have_content('Engine deleted successfully')
      }.to change { Engine.count }.by(-1)
    end

    it 'does not allow a non admin user to edit another user\'s engine' do
      visit engine_path(engine2)
      expect(page).not_to have_selector(:link_or_button, 'Edit Engine')
      expect(page).not_to have_selector(:link_or_button, 'Delete Engine')
      expect(page).to have_content('You are not authorized to perform this action.')
      expect(page).to have_current_path(root_path)
    end

    it 'allows a non admin user to view their own engines' do
      visit engines_path
      expect(page).to have_content(engine.name)
      expect(page).not_to have_content(engine2.name)
      expect(page).to have_current_path(engines_path)
    end

    it 'does not allow a non admin user to view another user\'s engines' do
      visit engine_path(engine2)
      expect(page).not_to have_content(engine2.name)
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'does not allow a non admin user to delete an engine which belongs to another user' do
      visit engine_path(engine2)
      expect(page).not_to have_selector(:link_or_button, 'Delete')
      expect(page).to have_content('You are not authorized to perform this action.')
      expect(page).to have_current_path(root_path)
    end
  end

  context 'when an admin user is logged in' do
    before do
      login_as(admin, scope: :user)
      engine
      engine2
    end

    it 'allows an admin user to create an engine' do
      visit dashboard_index_path
      expect(page).to have_selector(:link_or_button, 'Add Engine')
      click_on 'Add Engine'
      expect(page).to have_current_path(new_engine_path)
      expect {
        fill_in 'Name', with: 'New Engine'
        fill_in 'Engine make', with: 'New Engine Make'
        fill_in 'Engine model', with: 'New Engine Model'
        fill_in 'Year manufactured', with: '2021'
        fill_in 'Engine number', with: '123456'
        fill_in 'Barrel number', with: '123456'
        fill_in 'Seal number', with: '123456'
        fill_in 'Notes', with: 'New Engine Notes'
        click_on 'Save Engine'
      }.to change { Engine.count }.by(1)
      expect(page).to have_content('Engine added successfully')
      expect(page).to have_current_path(engine_path(Engine.last))
    end

    it 'allows an admin user to edit an engine' do
      visit engine_path(engine)
      expect(page).to have_selector(:link_or_button, 'Edit Engine')
      click_on 'Edit Engine'
      expect(page).to have_current_path(edit_engine_path(engine))
      fill_in 'Name', with: 'Updated Engine'
      click_on 'Save Engine'
      expect(page).to have_content('Engine updated successfully')
      expect(page).to have_current_path(engine_path(engine))
    end

    it 'allows an admin user to delete an engine' do
      visit engine_path(engine)
      expect(page).to have_selector(:link_or_button, 'Delete Engine')
      expect {
        accept_confirm do
          click_on 'Delete Engine'
        end
        expect(page).to have_content('Engine deleted successfully')
      }.to change { Engine.count }.by(-1)
    end\

    it 'allows an admin user to view all engines' do
      visit engines_path
      expect(page).to have_content(engine.name)
      expect(page).to have_content(engine2.name)
    end
  end
end