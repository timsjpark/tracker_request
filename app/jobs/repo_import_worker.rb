class RepoImportWorker < ActiveJob::Base
  queue_as = :default

  def perform(current_user_id)
    GithubApi::RepoImport.new(current_user_id).repositories_to_db
  end
end
