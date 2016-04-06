require 'rails_helper'

RSpec.describe Client::Github, type: :feature do

  describe ".connect" do
    before do
      @user = build(:user)
      @client = Client::Github.new(@user).connect
    end

    it 'returns a Octokit::Client class' do
      expect(@client.class).to eq(Octokit::Client)
    end

    it 'returns the Github API endpoint' do
      expect(@client.api_endpoint).to eq("https://api.github.com/")
    end

    it 'returns the Github API token' do
      expect(@client.access_token.nil?).to eq(false)
    end
  end
end
