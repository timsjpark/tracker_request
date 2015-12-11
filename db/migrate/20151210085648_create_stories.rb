class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :story_ident
      t.string :kind
      t.string :name
      t.text :description
      t.string :story_type
      t.string :current_state
      t.string :estimate
      t.belongs_to :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
