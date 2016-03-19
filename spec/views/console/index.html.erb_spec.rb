require 'rails_helper'

RSpec.describe "console/index.html.erb", type: :view do
  #Once the user is signed in
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

      # Display the image to the user
      it "shows the user their github image" do
        within('.col-md-4.console-panel.profile-panel') {
          expect(page).to have_css('img[src="jtest.png"]')
        }
      end
    end

    describe "Repositories" do
      before do
        repo = create_list(:repository, 4)
        #puts "================"
        #puts Repository.count
        #puts "================"
      end

      it 'shows the user the repository count' do
        within('p.repo-count') {
          expect(page).to have_content('4')
        }
      end

      it 'shows the user the repository list' do
        within('.list-group.repo-list') {
          expect(page).to have_css('a.list-group-item', count: 4)
        }
      end
    end

    describe "Projects" do
    end

    describe "Branches" do
    end

    describe "Pull Requests" do
    end

  # Add test to make sure projects are showing (Factory Girl)
  # Add test to make sure projects count is correct (Factory Girl)
  # Add test to make sure branches are showing on the console (Factory Girl)
  # Add test to make sure pull requests are showing (Factory Girl)
end
