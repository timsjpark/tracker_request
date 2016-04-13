class ProjectImportWorker < ActiveJob::Base
  queue_as = :default

  def perform(current_user_id)
    PivotalApi::ProjectImport.new(current_user_id).projects_to_db
  end
end
