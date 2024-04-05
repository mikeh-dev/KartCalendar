require 'rails_helper'

RSpec.describe TrackPolicy do
  subject { described_class.new(user, track) }
  
    let(:track) { create(:track) }
  
    context 'being a visitor' do
      let(:user) { nil }
  
      it { is_expected.not_to permit_action(:new) }
      it { is_expected.not_to permit_action(:create) }
      it { is_expected.not_to permit_action(:edit) }
      it { is_expected.not_to permit_action(:update) }
      it { is_expected.not_to permit_action(:destroy) }
    end
  
    context 'being a user' do
      let(:user) { create(:user, admin: false, role: '') }
  
      it { is_expected.to permit_action(:index) }
      it { is_expected.to permit_action(:show) }
      it { is_expected.not_to permit_action(:new) }
      it { is_expected.not_to permit_action(:create) }
      it { is_expected.not_to permit_action(:edit) }
      it { is_expected.not_to permit_action(:update) }
      it { is_expected.not_to permit_action(:destroy) }
    end
  
    context 'being an admin' do
      let(:user) { create(:user , admin: true) }
  
      it { is_expected.to permit_action(:new) }
      it { is_expected.to permit_action(:create) }
      it { is_expected.to permit_action(:edit) }
      it { is_expected.to permit_action(:update) }
      it { is_expected.to permit_action(:destroy) }
      it { is_expected.to permit_action(:index) }
      it { is_expected.to permit_action(:show) }
    end
  
    context 'being the track owner' do
      let(:user) { create(:user, admin: false, role: 'manager') }
      let(:track) { create(:track, user: user) }
      it { is_expected.to permit_action(:edit) }
      it { is_expected.to permit_action(:update) }
      it { is_expected.not_to permit_action(:destroy) }
      it { is_expected.to permit_action(:index) }
      it { is_expected.to permit_action(:show) }
      it { is_expected.not_to permit_action(:new) }
    end
end