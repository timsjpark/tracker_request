class TrackerCommentImportWorker
  @queue = :tracker_comment_import_worker

  def self.perform(current_user_id)
    PivotalApi::StoryCommentImport.new(current_user_id).story_comments_to_db
  end
end
