require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  describe 'password validations' do
    it 'requires a password' do
      user = build(:user, password: nil, password_confirmation: nil)
      expect(user).not_to be_valid
    end

    it 'requires a matching password confirmation' do
      user = build(:user, password: 'password123', password_confirmation: "different")
      expect(user).not_to be_valid
    end

    it 'rejects short passwords' do
      user = build(:user, password: 'short', password_confirmation: 'short')
      expect(user).not_to be_valid
    end

    it 'accepts valid passwords' do
      user = build(:user, password: 'longpassword', password_confirmation: 'longpassword')
      expect(user).to be_valid
    end
  end

  describe 'email validations' do
    it 'rejects invalid email formats' do
      user = build(:user, email: 'invalidemail')
      expect(user).not_to be_valid
    end

    it 'accepts valid email formats' do
      user = build(:user, email: 'mail@test.com')
      expect(user).to be_valid
    end
  end
end
