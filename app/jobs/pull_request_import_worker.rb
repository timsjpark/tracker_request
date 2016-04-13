class PullRequestImportWorker < ActiveJob::Base
  queue_as = :default

  def perform(current_user_id)
    GithubApi::PullRequestImport.new(current_user_id).pull_requests_to_db
  end
end
