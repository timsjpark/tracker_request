class AddCommentIdentToTrackerComments < ActiveRecord::Migration
  def change
    add_column :tracker_comments, :comment_ident, :string
  end
end
