class CreatePullRequests < ActiveRecord::Migration
  def change
    create_table :pull_requests do |t|
      t.string :pr_state
      t.string :pr_base_commit
      t.integer :pr_github_id
      t.string :pr_title
      t.text :pr_body
      t.belongs_to :repository, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
