require 'rails_helper'

RSpec.describe "Tracks", type: :request do
  let(:admin_user) { FactoryBot.create(:user, :admin) }
  let(:non_admin_user) { FactoryBot.create(:user) }
  let(:track) { FactoryBot.create(:track) }

  describe "POST /tracks" do
    let(:track_attributes) { FactoryBot.attributes_for(:track) }

    context "as an admin user" do
      before { login_as admin_user }

      it "allows creating a track" do
        expect {
          post tracks_path, params: { track: track_attributes }
        }.to change(Track, :count).by(1)

        expect(response).to have_http_status(:redirect) 
      end
    end

    context "as a non-admin user" do
      before { login_as non_admin_user }

      it "does not allow creating a track" do
        expect {
          post tracks_path, params: { track: track_attributes }
        }.not_to change(Track, :count)

        expect(response).to have_http_status(:found)
      end
    end
  end

  describe "PATCH /tracks/:id" do
    let(:update_params) { { track: { name: "Updated Track Name" } } }

    context "as an admin user" do
      before { login_as admin_user }

      it "allows updating a track" do
        patch track_path(track), params: update_params
        track.reload

        expect(track.name).to eq("Updated Track Name")
        expect(response).to have_http_status(:found)
      end
    end

    context "as a non-admin user" do
      before { login_as non_admin_user }

      it "does not allow updating a track" do
        patch track_path(track), params: update_params
        original_name = track.name
        track.reload

        expect(track.name).to eq(original_name)
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe "DELETE /tracks/:id" do
    context "as an admin user" do
      before { login_as admin_user }

      it "allows deleting a track" do
        delete track_path(track)
        expect(response).to have_http_status(:redirect)
        expect(Track.exists?(track.id)).to be false
      end
    end

    context "as a non-admin user" do
      before { login_as non_admin_user }

      it "does not allow deleting a track" do
        delete track_path(track)
        expect(response).to have_http_status(:found)
        expect(Track.exists?(track.id)).to be true
      end
    end
  end
end
