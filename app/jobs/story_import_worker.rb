class StoryImportWorker
  @queue = :story_import_worker

  def self.perform(current_user_id)
    PivotalApi::StoryImport.new(current_user_id).stories_to_db
  end
end
