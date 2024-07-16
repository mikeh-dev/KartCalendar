require 'rails_helper'

RSpec.describe 'User Permissions', type: :system do
  let(:admin) { FactoryBot.create(:user, :admin) }
  let(:non_admin) { FactoryBot.create(:user) }
  let(:track) { FactoryBot.create(:track) }
  let(:event) { FactoryBot.create(:event) }
  let(:championship) { FactoryBot.create(:championship) }
  let(:another_user) { FactoryBot.create(:user) }

  before do
    login_as(non_admin, scope: :user)
  end

  context 'when a non admin user is logged in' do
    it 'does not allow non-admin to create a track' do
      visit new_track_path
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'does not allow non-admin to edit a track' do
      visit tracks_path
      expect(page).not_to have_selector(:link_or_button, 'Edit')
      visit edit_track_path(track)
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'does not allow non-admin to delete a track' do
      visit track_path(track)
      expect(page).not_to have_selector(:link_or_button, 'Delete')
    end

    it 'does not allow non-admin to create an event' do
      visit new_event_path
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'does not allow non-admin to edit an event' do
      visit event_path(event)
      expect(page).not_to have_selector(:link_or_button, 'Edit Event')
      visit edit_event_path(event)
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'does not allow non-admin to delete an event' do
      visit event_path(event)
      expect(page).not_to have_selector(:link_or_button, 'Delete')
    end

    it 'does not allow a non-admin user to create a championship' do
      visit championships_path
      expect(page).not_to have_selector(:link_or_button, 'New Championship')
      visit new_championship_path
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'does not allow a non-admin user to edit a championship' do
      visit championship_path(championship)
      expect(page).not_to have_selector(:link_or_button, 'Edit')
      visit edit_championship_path(championship)
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('You are not authorized to perform this action.')
    end

    it 'does not allow a non-admin user to delete a championship' do
      visit championship_path(championship)
      expect(page).not_to have_selector(:link_or_button, 'Delete')
    end

    it 'does allow a non-admin user to create an engine' do
      visit new_engine_path
      expect(page).to have_current_path(new_engine_path)
      fill_in 'Name', with: 'New Engine'
      fill_in 'Engine number', with: '123456'
      fill_in 'Engine make', with: 'New Engine Make'
      fill_in 'Engine model', with: 'New Engine Model'
      fill_in 'Year manufactured', with: '2021'
      fill_in 'Barrel number', with: '123456'
      fill_in 'Seal number', with: '123456'
      fill_in 'Notes', with: 'New Engine Notes'
      click_on 'Save Engine'
      expect(page).to have_content('Engine added successfully')
    end
  end

  context 'when an admin user is logged in' do
    before do
      login_as(admin, scope: :user)
    end

    let!(:track_to_edit) { FactoryBot.create(:track, name: "Editable Track", address: "Editable Address", description: "Editable Description") }
    let!(:event_to_edit) { FactoryBot.create(:event, title: "Editable Event", start_date: "2021-12-30", end_date: "2021-12-31", description: "Editable Description", event_type: "Editable Event Type") }

    it 'allows an admin user to create a track' do
      visit new_track_path
      fill_in 'Name', with: 'New Track'
      fill_in 'Address', with: '123 Track Lane'
      fill_in 'Contact number', with: "1234567890"
      fill_in 'Length (metres)', with: '1122'
      fill_in 'Description', with: 'New Track Description'
      fill_in 'Location', with: 'New Track Location'
      fill_in 'Short desc', with: 'New Track Short Desc'
      fill_in 'Email', with: 'knansd@ddd.com'
      fill_in 'Website', with: 'www.newtrack.com'
      fill_in 'Latitude', with: '53.503764'
      fill_in 'Longitude', with: '-2.633295'
      click_on 'Save Track'
      expect(page).to have_content('Track was successfully created.')
      expect(page).to have_current_path(track_path(Track.last))
    end

    it 'allows an admin user to edit a track' do
      visit track_path(track_to_edit)
      click_on 'Edit Track'
      fill_in 'Name', with: 'Edited Track Name'
      click_on 'Save Track'
      expect(page).to have_current_path(track_path(track_to_edit))
      expect(page).to have_content('Track was successfully updated.')
    end

    it 'allows an admin user to delete a track' do
      visit track_path(track_to_edit)
      click_on 'Edit Track'
      expect(page).to have_current_path(edit_track_path(track_to_edit))
      accept_confirm do
        click_on 'Delete Track'
      end
      expect(page).to have_current_path(tracks_path)
      expect(page).to have_content('Track was successfully destroyed.')
    end

    it 'allows an admin user to create an event' do
      visit new_event_path
      fill_in 'Title', with: 'New Event'
      fill_in 'Start date', with: '2021-12-30'
      fill_in 'End date', with: '2021-12-31'
      fill_in 'Description', with: 'New Event Description'
      select 'Race', from: 'Event type'
      fill_in 'Price', with: '100'
      select 'Editable Track', from: 'event_track_id'
      click_on 'Save'
      expect(page).to have_content('Event was successfully created.')
      expect(page).to have_current_path(event_path(Event.last))
    end

    it 'allows an admin user to edit an event' do
      visit edit_event_path(event)
      fill_in 'Title', with: 'Edited Event Name'
      click_on 'Save'
      expect(page).to have_content('Event was successfully updated.')
      expect(page).to have_current_path(event_path(event))
    end

    it 'allows an admin user to delete an event' do
      visit edit_event_path(event)
      accept_confirm do
        click_on 'Delete Event'
      end
      expect(page).to have_current_path(events_path)
      expect(page).to have_content('Event was successfully deleted.')
    end

    it 'allows an admin user to create a championship' do
      visit new_championship_path
  
      fill_in 'Name', with: 'New Championship'
      fill_in 'Description', with: 'New Championship Description'
      fill_in 'Tagline', with: 'New Championship Tagline'
      fill_in 'Short name', with: 'New Champ'
      fill_in 'Long name', with: 'New Championship Name'
  
      click_on 'Save'
      expect(page).to have_content('Championship was successfully created.')
      expect(page).to have_current_path(championship_path(Championship.last))
    end

    it 'allows an admin user to edit a championship' do
      visit championship_path(championship)
      click_on 'Edit Championship'
      fill_in 'Name', with: 'Updated Championship Name'
      click_on 'Save'
      expect(page).to have_current_path(championship_path(championship))
      expect(page).to have_content('Championship was successfully updated.')
    end

    it 'allows an admin user to delete a championship' do
      visit championship_path(championship)
      click_on 'Edit Championship'
      accept_confirm do
        click_on 'Delete Championship'
      end
      expect(page).to have_current_path(championships_path)
      expect(page).to have_content('Championship was successfully destroyed.')      
    end
  end
end 