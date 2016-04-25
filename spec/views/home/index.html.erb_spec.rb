require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  include Capybara::DSL

  before do
    visit '/'
  end

  describe "When a user first goes to the home page" do
    it 'shows a user the about and contact links in the nav bar' do
      expect(page).to have_content('About')
      expect(page).to have_content('Contact')
    end
  end

  describe "When the user isn't logged in" do
    it 'show the user the sign in link' do
      expect(page).to have_content('Sign In')
    end
  end

  describe "When the user is logged in" do
    before do
      OmniAuthMock::User.new.current_user
    end

    it 'show the user the sign out link' do
      expect(page).to have_content('Sign Out')
    end
  end
end
