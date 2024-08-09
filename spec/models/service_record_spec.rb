require 'rails_helper'

RSpec.describe ServiceRecord, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:engine_builder) }
    it { is_expected.to validate_presence_of(:new_seal_number) }
    
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:engine) }
    it { is_expected.to have_one_attached(:invoice) }
    it { is_expected.to have_many_attached(:dyno_sheets) }
  end
end