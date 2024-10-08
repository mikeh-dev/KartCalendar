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
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:event_type) }
    it { should validate_presence_of(:track_id) }
  end
end