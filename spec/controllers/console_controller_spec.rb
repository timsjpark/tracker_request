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
      Capybara.default_host = 'http://127.0.0.1:3000'
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:github] = {
        provider: 'github',
        uid: '1234567',
        credentials: {
          token: '3kynje'
        },
        info: {
          nickname: 'jtest',
          name: 'Joe Test',
          email: 'email@email.com',
          image: 'jtest.jpg'
        }
      }
      visit 'auth/github'
    end

    describe "User tries to access the console page" do
      it "allows user to view console#index page" do
          visit '/'
          expect(page).to have_content('Jtest')
      end
    end

    describe "User tries to access profile page" do
      it "allows user to view console#profile page"
    end
    describe "User tries to access the statistics page" do
      it "allows user to view console#statistics page"
    end
  end

end
