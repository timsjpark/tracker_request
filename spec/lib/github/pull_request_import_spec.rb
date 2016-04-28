require 'rails_helper'

RSpec.describe GithubApi::PullRequestImport, type: :feature do

  before do
    @user = build(:user)
    @user.save
    GithubApi::RepoImport.new(@user.id).repositories_to_db
    GithubApi::PullRequestImport.new(@user.id).pull_requests_to_db
    repo_id_array = []
    repos = Repository.where(user_id: @user.id).all
    repos.each {|x| repo_id_array << x.id}
    @pull_requests = PullRequest.where(repository_id: repo_id_array).all
  end

  describe '.pull_requests_to_db' do
    it 'Saves the correct number of pull requests to the DB' do
      expect(@pull_requests.count).to eq(1)
    end

    it 'Saves the correct pull request name from Github API' do
      expect(@pull_requests.first.pr_title).to eq("Added the test file to the repo branch")
    end

    it 'Saves the state of the pull request from Github API' do
      expect(@pull_requests.first.pr_state).to eq("open")
    end

    it 'Saves the correct pull request body from Github API' do
      expect(@pull_requests.first.pr_github_ident).to eq(67672532)
    end

    it 'Saves the correct pull request base commit from Github API' do
      expect(@pull_requests.first.pr_base_commit).to eq("2d71188d8e169a6b9e3a972d5da502795af55904")
    end
  end
end
