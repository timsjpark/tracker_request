class StoryImportWorker < ActiveJob::Base
  queue_as = :default

  def perform(current_user_id)
    PivotalApi::StoryImport.new(current_user_id).stories_to_db
  end
end
