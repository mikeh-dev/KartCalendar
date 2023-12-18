require 'rails_helper'

RSpec.describe 'Non-user viewer', type: :system do
  describe 'tracks' do
    it 'can view the index page' do
      visit tracks_path
      expect(page).to have_content('Tracks')
    end

    it 'can view a track show page' do
      track = create(:track)
      visit track_path(track)
      expect(page).to have_content(track.name)
    end
  end

  describe 'events' do
    it 'can view the index page' do
      visit events_path
      expect(page).to have_content('Events')
    end

    it 'can view an event show page' do
      event = create(:event)
      visit event_path(event)
      expect(page).to have_content(event.title)
    end
  end

  describe 'championships' do
    it 'can view the index page' do
      visit championships_path
      expect(page).to have_content('Championships')
    end

    it 'can view a championship show page' do
      championship = create(:championship)
      visit championship_path(championship)
      expect(page).to have_content(championship.name)
    end
  end
end
