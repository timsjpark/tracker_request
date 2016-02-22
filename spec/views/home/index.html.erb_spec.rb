require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  describe "When a user first goes to the home page" do
    it 'shows a user the about and contact links in the nav bar' do
      visit '/'
      expect(page).to have_content('About')
      expect(page).to have_content('Contact')
    end
  end

  describe "When the user isn't logged in" do
    it 'show the user the sign in link'
  end

  describe "When the user is logged in" do
    it 'show the user the sign out link'
  end
end
