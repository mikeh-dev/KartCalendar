require 'rails_helper'

RSpec.describe Track, type: :model do
  let(:track) { FactoryBot.create(:track) }

  describe "associations" do
    it { should have_many(:events) }
    it { should have_many(:follows).dependent(:destroy) }
    it { should have_one_attached(:main_image) }
    it { should have_one_attached(:logo) }
    it { should have_one_attached(:race_image) }
    it { should have_one_attached(:test_image) }
    it { should have_one_attached(:champ_image) }
    it { should have_one_attached(:contact_image) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:contact_number) }
    it { should validate_presence_of(:length) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:short_desc) }
    it { should validate_presence_of(:website) }
  end

end