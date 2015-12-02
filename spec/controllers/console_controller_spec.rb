require 'rails_helper'

RSpec.describe ConsoleController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #profile" do
    it "returns http success" do
      get :profile
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #statistics" do
    it "returns http success" do
      get :statistics
      expect(response).to have_http_status(:success)
    end
  end

end
