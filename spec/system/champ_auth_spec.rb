require 'rails_helper'

RSpec.describe "ChampionshipAuth", type: :system do

  let(:user) { create(:user) }
  let(:admin) { create(:user, admin: true) }
  let(:manager) { create(:user, role: 'manager') }
  let(:championship) { create(:championship, user: manager) }

  context 'as an admin user' do
    before do
      login_as admin
    end
  end

  context 'as a manager user' do
    before do
      login_as manager
      championship
    end
  end
end