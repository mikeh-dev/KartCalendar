require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { FactoryBot.create(:event) }

  describe "associations" do
    it { should have_and_belong_to_many(:users).join_table('event_users') }
    it { should belong_to(:championship).optional }
    it { should belong_to(:track) }
    it { should have_many(:follows).dependent(:destroy) }
    it { should have_one_attached(:image) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:event_type) }
    it { should validate_presence_of(:track_id) }
  end

  describe "methods" do
    describe "#random_image_url" do
      it "returns a random image URL" do
        expect(event.random_image_url).to be_a(String)
      end
    end

    describe ".upcoming_based_on_date" do
      it "returns upcoming events based on date" do
        upcoming_event = FactoryBot.create(:event, date: Date.tomorrow)

        expect(Event.upcoming_based_on_date).to eq([upcoming_event])
      end

      it "does not include past events" do
        past_event = FactoryBot.create(:event, date: Date.yesterday)
    
        expect(Event.upcoming_based_on_date).not_to include(past_event)
      end
    
      it "returns an empty array when there are no upcoming events" do
        expect(Event.upcoming_based_on_date).to be_empty
      end
    end

    describe ".next_based_on_date" do
      it "returns the next upcoming event based on date" do
        upcoming_event = FactoryBot.create(:event, date: Date.tomorrow)

        expect(Event.next_based_on_date).to eq(upcoming_event)
      end
    end
  end
end