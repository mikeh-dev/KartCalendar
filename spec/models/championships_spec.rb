require 'rails_helper'

RSpec.describe Championship, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:short_name) }
  it { should validate_presence_of(:long_name) }

  it { should have_many(:events) }
  it { should have_one_attached(:image) }
  it { should have_one_attached(:logo) }

  describe '#next_event' do
    let(:championship) { create(:championship) }
    let!(:past_event) { create(:event, championship: championship, date: 1.day.ago) }
    let!(:future_event1) { create(:event, championship: championship, date: 1.day.from_now) }
    let!(:future_event2) { create(:event, championship: championship, date: 2.days.from_now) }

    it 'returns the next event based on the current date' do
      expect(championship.next_event).to eq(future_event1)
    end
  end
end