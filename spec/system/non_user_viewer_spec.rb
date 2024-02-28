require 'rails_helper'

RSpec.describe 'Non-user viewer', type: :system do
  let(:track) { FactoryBot.create(:track) }
  let(:event) { FactoryBot.create(:event) }
  let(:championship) { FactoryBot.create(:championship) }

  describe 'general page viewings' do
    it 'can view the home page' do
      visit root_path
      expect(page).to have_content('KartStream')
    end

    it 'can view the about page' do
      visit about_path
      expect(page).to have_content('KartStream was born')
    end

  end


  describe 'tracks' do
    it 'can view the index page' do
      visit tracks_path
      expect(page).to have_content('Tracks')
    end

    it 'can view a track show page' do
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
      visit championship_path(championship)
      expect(page).to have_content(championship.name)
    end
  end
end
