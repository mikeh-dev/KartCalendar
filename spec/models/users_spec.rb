require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }

  it "should require a password" do
    user = build(:user, password: nil, password_confirmation: nil)
    expect(user).not_to be_valid
  end

  it "should require a matching password confirmation" do
    user = build(:user, password_confirmation: "different")
    expect(user).not_to be_valid
  end

end