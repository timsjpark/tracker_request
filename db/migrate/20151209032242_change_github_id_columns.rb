class ChangeGithubIdColumns < ActiveRecord::Migration
  def change
    rename_column :repositories, :repo_github_id, :repo_github_ident
    rename_column :branches, :branch_github_id, :branch_github_ident
    rename_column :pull_requests, :pr_github_id, :pr_github_ident
    rename_column :pull_request_comments, :pr_comment_github_id, :pr_comment_github_ident
  end
end
