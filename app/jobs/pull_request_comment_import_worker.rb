class PullRequestCommentImportWorker < ActiveJob::Base
  queue_as = :default

  def perform(current_user_id)
    GithubApi::PullRequestCommentImport.new(current_user_id).pr_comments_to_db
  end
end
