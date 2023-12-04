require 'rails_helper'

RSpec.describe "Championships", type: :request do
  let(:admin_user) { FactoryBot.create(:user, :admin) }
  let(:non_admin_user) { FactoryBot.create(:user) }
  let(:championship) { FactoryBot.create(:championship) }
  let(:championship_params) { { championship: { name: "New Championship", price: 100, description: "New Championship Description" } } }
  let(:update_params) { { championship: { name: "Updated Championship Name" } } }


  describe "POST /championships" do
    context "as an admin user" do
      before { login_as admin_user }

      it "allows creating a championship" do
        expect {
          post championships_path, params: championship_params
        }.to change(Championship, :count).by(1)

        expect(response).to have_http_status(:redirect) 
      end
    end

    context "as a non-admin user" do
      before { login_as non_admin_user }

      it "does not allow creating a championship" do
        expect {
          post championships_path, params: championship_params
        }.not_to change(Championship, :count)

        expect(response).to have_http_status(:found)
      end
    end
  end

  describe "PATCH /championships/:id" do
    context "as an admin user" do
      before { login_as admin_user }

      it "allows updating a championship" do
        patch championship_path(championship), params: update_params
        championship.reload

        expect(championship.name).to eq("Updated Championship Name")
        expect(response).to have_http_status(:found)
      end
    end

    context "as a non-admin user" do
      before { login_as non_admin_user }

      it "does not allow updating a championship" do
        patch championship_path(championship), params: update_params
        original_name = championship.name
        championship.reload

        expect(championship.name).to eq(original_name)
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe "DELETE /championships/:id" do
    context "as an admin user" do
      before { login_as admin_user }

      it "allows deleting a championship" do
        delete championship_path(championship)

        expect(response).to have_http_status(:redirect)
      end
    end

    context "as a non-admin user" do
      before { login_as non_admin_user }

      it "does not allow deleting a championship" do
        championship_to_delete = FactoryBot.create(:championship)
        expect {
          delete championship_path(championship_to_delete)
        }.not_to change(Championship, :count)
        
        expect(response).to have_http_status(:found)
        expect(Championship.exists?(championship.id)).to be true
      end
    end
  end
end