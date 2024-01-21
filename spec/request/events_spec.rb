require 'rails_helper'

RSpec.describe "Events", type: :request do
  let(:admin_user) { FactoryBot.create(:user, :admin) }
  let(:non_admin_user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event) }
  let(:track) { FactoryBot.create(:track) }

  describe "POST /events" do
    let(:event_params) { { event: { title: "New Event", description: "Test event", start_date: Date.today, end_date: Date.tomorrow, price: 100, event_type: "Test", track_id: track.id } } }

    context "as an admin user" do
      before { login_as admin_user }

      it "allows creating an event" do
        expect {
          post events_path, params: event_params
        }.to change(Event, :count).by(1)

        expect(response).to have_http_status(:redirect)
      end
    end

    context "as a non-admin user" do
      before { login_as non_admin_user }

      it "does not allow creating an event" do
        expect {
          post events_path, params: event_params
        }.not_to change(Event, :count)

        expect(response).to have_http_status(:found)
      end
    end
  end

  describe "PATCH /events/:id" do
    let(:update_params) { { event: { title: "Updated Event", description: "Updated description" } } }

    context "as an admin user" do
      before { login_as admin_user }

      it "allows updating an event" do
        patch event_path(event), params: update_params
        event.reload

        expect(event.title).to eq("Updated Event")
        expect(event.description).to eq("Updated description")
        expect(response).to have_http_status(:found)
      end
    end

    context "as a non-admin user" do
      before { login_as non_admin_user }

      it "does not allow updating an event" do
        patch event_path(event), params: update_params
        original_title = event.title
        original_description = event.description
        event.reload

        expect(event.title).to eq(original_title)
        expect(event.description).to eq(original_description)
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe "DELETE /events/:id" do
    context "as an admin user" do
      before { login_as admin_user }

      it "allows deleting an event" do
        delete event_path(event)
        expect(response).to have_http_status(:redirect)
        expect(Event.exists?(event.id)).to be false
      end
    end

    context "as a non-admin user" do
      before { login_as non_admin_user }

      it "does not allow deleting an event" do
        delete event_path(event)
        expect(response).to have_http_status(:found)
        expect(Event.exists?(event.id)).to be true
      end
    end
  end
end