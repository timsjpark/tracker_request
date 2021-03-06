require 'rails_helper'

RSpec.describe ConsoleController, type: :controller do

  describe "User is not logged in and tries to acces the console" do

    describe "User tries to access the index page" do
      it "redirects user back to home page" do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end

    describe "User tries to access the profile page" do
      it "redirect user back to home page" do
        get :profile
        expect(response).to have_http_status(:redirect)
      end
    end

    describe "User tries to access the statistics page" do
      it "redirects user back to home page" do
        get :statistics
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "User is logged in" do

    before do
      OmniAuthMock::User.new.current_user
    end

    describe "User tries to access the console page" do
      it "allows user to view console#index page" do
        visit '/console'
        expect(response).to have_http_status(:success)
      end
    end

    describe "User tries to access profile page" do
      it "allows user to view console#profile page" do
        visit '/console/profile'
        expect(response).to have_http_status(:success)
      end
    end

    describe "User tries to access the statistics page" do
      it "allows user to view console#statistics page" do
        visit '/console/statistics'
        expect(response).to have_http_status(:success)
      end
    end
  end
end
