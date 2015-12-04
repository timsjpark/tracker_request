class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.integer :repo_id
      t.string :repo_name
      t.integer :number_of_forks
      t.boolean :forked
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
