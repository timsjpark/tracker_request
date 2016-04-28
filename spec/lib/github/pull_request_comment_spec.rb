require 'rails_helper'

RSpec.describe GithubApi::PullRequestCommentImport, type: :feature do

  before do
    @user = build(:user)
    @user.save
    GithubApi::RepoImport.new(@user.id).repositories_to_db
    GithubApi::PullRequestCommentImport.new(@user.id).pr_comments_to_db
    repo_id_array = []
    repos = Repository.where(user_id: @user.id).all
    repos.each {|x| repo_id_array << x.id}
    @pr_comments = PullRequestComment.where(repository_id: repo_id_array).all
  end

  describe '.pr_comments_to_db' do
    it 'Saves the correct number of pull request comments to the DB' do
      expect(@pr_comments.count).to eq(2)
    end

    it 'Saves the correct github id for the PR comments from Github API' do
      expect(@pr_comments.first.pr_comment_github_ident).to eq(214165163)
    end

    it 'Saves the PR comment body from the Github Api' do
      expect(@pr_comments.last.content_text).to eq("It looks good to me 👍 ")
    end
  end
end
