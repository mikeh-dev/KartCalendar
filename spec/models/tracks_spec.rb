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
    it { should have_many_attached(:home_championships).class_name('Championship').with_foreign_key('home_track_id') }
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

    it 'should validate length of name' do
      expect(track).to validate_length_of(:name).is_at_least(2).is_at_most(50)
    end

    it 'should validate format of email' do
      expect(track).to allow_value("test@example.com").for(:email)
      expect(track).to_not allow_value("test@example").for(:email)
    end
  end

  describe 'social media accessors' do
    it 'allows setting and getting facebook and instagram' do
      track.facebook = 'facebook_url'
      track.instagram = 'instagram_url'
      expect(track.facebook).to eq('facebook_url')
      expect(track.instagram).to eq('instagram_url')
    end
  end
end