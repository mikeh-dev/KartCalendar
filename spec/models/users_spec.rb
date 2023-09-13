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

  it "should reject short passwords" do
    user = build(:user, password: "short", password_confirmation: "short")
    expect(user).not_to be_valid
  end

  it "should accept long passwords" do
    user = build(:user, password: "longpassword", password_confirmation: "longpassword")
    expect(user).to be_valid
  end

  it "should have reject and invalid email" do
    user = build(:user, email: "invalidemail")
    expect(user).not_to be_valid
  end

  it "should have a valid email" do
    user = build(:user, email: "mail@test.com")
    expect(user).to be_valid
  end

end