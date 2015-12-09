class RemoveBranchGithubId < ActiveRecord::Migration
  def change
    remove_column :branches, :branch_github_ident
  end
end
