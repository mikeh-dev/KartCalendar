require 'rails_helper'

RSpec.describe Engine, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:service_records).dependent(:nullify) }
    it { should have_many_attached(:engine_photos) }
    it { should have_many_attached(:dyno_sheet) }
    it { should have_one_attached(:logbook_cover) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:engine_number) }
    it { should validate_presence_of(:engine_make) }
    it { should validate_presence_of(:engine_model) }
    it { should validate_presence_of(:year_manufactured) }
  end
end