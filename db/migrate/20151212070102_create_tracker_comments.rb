class CreateTrackerComments < ActiveRecord::Migration
  def change
    create_table :tracker_comments do |t|
      t.string :text
      t.belongs_to :story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
