class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :author
      t.string :commit_message
      t.belongs_to :branch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
