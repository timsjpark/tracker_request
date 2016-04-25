require 'rails_helper'

RSpec.describe Client::Github, type: :feature do

  describe ".connect" do
    before do
      @user_profile = build(:user)
      @gh_client = Client::Github.new(@user_profile).connect
    end

    it 'returns a Octokit::Client class' do
      expect(@gh_client.class).to eq(Octokit::Client)
    end

    it 'returns the Github API endpoint' do
      expect(@gh_client.api_endpoint).to eq("https://api.github.com/")
    end

    it 'returns the Github API token' do
      expect(@gh_client.access_token.nil?).to eq(false)
    end

    it 'returns the correct username' do
      expect(@gh_client.user.login).to eq('BargainsNDealz')
    end
  end
end
