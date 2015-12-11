class AddParentRepoToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :parent_repo, :string
  end
end
