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

    before(:all) do
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
    end
    before do
      Capybara.default_host = 'http://127.0.0.1'
      puts "Capybara.current_host: #{Capybara.current_host}"
      puts "Capybara.default_host: #{Capybara.default_host}"
      puts "Capybara.current_url: #{Capybara.current_url}"
    end
    describe "User tries to access the console page" do
      it "allows user to view console#index page" do
          Capybara.default_host = 'http://127.0.0.1:3000'
          capy = Cabybara.default_host
          visit '/'
          visit "#{capy}/auth/github"
          save_and_open_page
          #click_link('Signin')
          visit 'auth/github/callback'
          expect(page).to have_content('Sign In!')
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
