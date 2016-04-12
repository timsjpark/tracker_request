class PullRequestImportWorker
  @queue = :pull_request_import_worker

  def self.perform(current_user_id)
    GithubApi::PullRequestImport.new(current_user_id).pull_requests_to_db
  end
end
