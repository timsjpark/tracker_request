class BranchImportWorker < ActiveJob::Base
  queue_as = :default

  def perform(current_user_id)
    GithubApi::BranchImport.new(current_user_id).branches_to_db
  end
end
