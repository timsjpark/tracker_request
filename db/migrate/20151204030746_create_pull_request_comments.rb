class CreatePullRequestComments < ActiveRecord::Migration
  def change
    create_table :pull_request_comments do |t|
      t.integer :pr_comment_id
      t.text :content_text
      t.belongs_to :pull_request, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
