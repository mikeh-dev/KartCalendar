require 'rails_helper'

RSpec.describe ServiceRecord, type: :model do
  # Validations
  describe 'validations' do
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:description) }
  end

  # Associations
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:engine) }
    it { is_expected.to have_one_attached(:invoice) }
    it { is_expected.to have_many_attached(:dyno_sheets) }
  end
end