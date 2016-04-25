require 'rails_helper'

RSpec.describe "console/index.html.erb", type: :view do
  include Capybara::DSL

    before do
      OmniAuthMock::User.new.current_user
    end

    describe "User is signed in and goes to index view" do
      before do
        visit '/console'
      end

      # show the user their username
      it "shows the user their username" do
        expect(page).to have_content('Jtest Profile:')
      end

      # Add test to display email
      it "shows the user their email address" do
        expect(page).to have_content('email@email.com')
      end

      # Display First and last name
      it "shows the user their full name" do
        expect(page).to have_content('Welcome Joe Test')
      end
    end
end
