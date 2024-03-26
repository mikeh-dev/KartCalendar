require 'rails_helper'

RSpec.describe 'Engine Permissions', type: :system do
  let(:admin) { FactoryBot.create(:user, :admin) }
  let(:non_admin) { FactoryBot.create(:user) }
  let(:another_user) { FactoryBot.create(:user) }
  let(:engine) { FactoryBot.create(:engine, user: non_admin) }
  let(:engine2) { FactoryBot.create(:engine, user: another_user) }

  before do
    login_as(non_admin, scope: :user)
  end

  context 'when a non admin user is logged in' do
    it 'allows an admin user to create an engine' do
      visit dashboard_index_path
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
      attach_file 'engine_engine_photos', Rails.root + 'spec/fixtures/files/test_image.jpg'
      attach_file 'engine_dyno_sheet', Rails.root + 'spec/fixtures/files/test_image.jpg'
      attach_file 'engine_logbook_cover', Rails.root + 'spec/fixtures/files/test_image.jpg'
      click_on 'Save Engine'
      expect(page).to have_content('Engine added successfully')
      expect(page).to have_current_path(engine_path(Engine.last))
    end

    it 'does not allow a non logged in user to create an Engine' do
      logout(:user)
      visit new_engine_path
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end

    it 'does not allow a user to edit or view an engine which does not belong to them' do
      visit edit_engine_path(engine2)
      expect(page).to have_content('You are not authorized to perform this action.')
      visit engine_path(engine2)
      expect(page).to have_content('You are not authorized to perform this action.')
    end


  end
end