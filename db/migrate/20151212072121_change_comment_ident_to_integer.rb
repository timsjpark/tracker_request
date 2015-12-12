class ChangeCommentIdentToInteger < ActiveRecord::Migration
  def change
    change_column :tracker_comments, :comment_ident, :integer
  end
end
