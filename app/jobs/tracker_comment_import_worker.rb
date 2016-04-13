class TrackerCommentImportWorker < ActiveJob::Base
  queue_as = :default

  def perform(current_user_id)
    PivotalApi::StoryCommentImport.new(current_user_id).story_comments_to_db
  end
end
