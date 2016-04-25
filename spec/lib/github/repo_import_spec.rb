require 'rails_helper'

RSpec.describe GithubApi::RepoImport, type: :feature do

  before do
    @user = build(:user)
    @user.save
    GithubApi::RepoImport.new(@user.id).repositories_to_db
    @repos = Repository.where(user_id: @user.id).all
  end

  describe ".repositories_to_db" do
    it 'Saves the correct amount of repositories in DB' do
      expect(Repository.where(user_id: @user.id).all.count).to eq(2)
    end

    it 'Saves the correct repository name from the Github API' do
      expect(@repos.last.repo_name).to eq("Test_repo")
    end

    it 'Saves the correct repository id from the Github API' do
      expect(@repos.first.repo_github_ident).to eq(30048480)
    end

    it 'Saves whether the repository has been forked or not' do
      expect(@repos.first.forked).to eq(false)
    end

    it 'Saves the number of forks the repo has' do
      expect(@repos.first.number_of_forks).to eq(1)
    end
  end
end
