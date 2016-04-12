class ProjectImportWorker
  @queue = :project_import_worker

  def self.perform(current_user_id)
    PivotalApi::ProjectImport.new(current_user_id).projects_to_db
  end
end
