require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = build(:user) # Using FactoryBot to create a user with factory attributes
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user = build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user = build(:user, password: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid with a duplicate email' do
      existing_user = create(:user, email: 'test@example.com')
      duplicate_user = build(:user, email: 'test@example.com')
      expect(duplicate_user).to_not be_valid
    end

    it 'is not valid with a short password' do
      user = build(:user, password: 'short')
      expect(user).to_not be_valid
    end
  end

  
end
