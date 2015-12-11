class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :project_ident
      t.string :name
      t.integer :iteration_length
      t.string :week_start_day
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
