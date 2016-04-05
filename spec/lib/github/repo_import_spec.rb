require 'rails_helper'

RSpec.describe GithubApi::RepoImport, type: :feature do

  describe "User credentials are called from the API" do
    before do
      uri = URI('https://api.github.com/users/mgm702')
      @response = JSON.load(Net::HTTP.get(uri))
    end
    it 'username should be the same as the Github API' do
      expect(@response['login']).to eq 'mgm702'
    end
  end
end
