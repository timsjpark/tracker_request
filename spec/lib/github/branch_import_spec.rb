require 'rails_helper'

RSpec.describe GithubApi::BranchImport, type: :feature do

  before do
    @user = build(:user)
    @user.save
    GithubApi::RepoImport.new(@user.id).repositories_to_db
    GithubApi::BranchImport.new(@user.id).branches_to_db
    repo_id_array = []
    repos = Repository.where(user_id: @user.id).all
    repos.each {|x| repo_id_array << x.id}
    @branches = Branch.where(repository_id: repo_id_array).all
  end

  describe '.branches_to_db' do
    it 'Saves the correct number of branches to the DB' do
      expect(@branches.count).to eq(3)
    end

    it 'Saves the correct branch name from the Github API' do
      test_branch = Branch.where(branch_name: "test_branch").first
      expect(test_branch.branch_name).to eq("test_branch")
    end

    it 'Saves the latest sha from the Github API' do
      test_branch = Branch.where(branch_name: "test_branch").first
      expect(test_branch.latest_commit_sha).to eq("e5d211bc64987b4bcce8d933d50966291e64304e")
    end
  end
end
