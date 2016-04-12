class PullRequestCommentImportWorker
  @queue = :pull_request_comment_import_worker

  def self.perform(current_user_id)
    GithubApi::PullRequestCommentImport.new(current_user_id).pr_comments_to_db
  end
end
