class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :branch_name
      t.string :latest_commit_sha
      t.belongs_to :repository, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
