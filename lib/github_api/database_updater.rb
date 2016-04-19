class GithubApi::Database_Updater

  def initialize
  end

  def update_database_to_match_api(current_user, api_ids, model_call, repo_ids=nil)
    case model_call
      when "repository"
        repo_matcher(current_user, api_ids)
      when "branch"
        if repo_ids != nil
          branch_matcher(current_user, api_ids, repo_ids)
        end
      when "pull_request"
        pull_requesT_matcher(current_user)
      when "pull_request_comment"
        pull_request_comment_matcher(current_user)
      else
        "Error finding database model!"
    end
  end

  private
  def repo_matcher(current_user, api_ids)
    repositories = Repository.where(user_id: current_user.id).all
    repo_ids = []
    repositories.each {|x| repo_ids << x.repo_github_ident}

    repo_ids.each {|x| puts x}
    puts "==============="
    api_ids.each {|x| puts x}
    puts "This is the repo that needs to be deleted #{repo_ids - api_ids}"
  end

  def branch_matcher(current_user, api_ids, repo_ids)
    branches = Branch.where(repository_id: repo_ids)
    branch_commit_sha = []
    branches.each {|x| branch_commit_sha << x.latest_commit_sha}
    branch_commit_sha.each {|x| puts x}
    puts "=============="
    api_ids.each {|x| puts x}
    puts "Branch Model counts #{branch_commit_sha.count}"
    puts "Branch API counts #{api_ids.count}"
    puts "These are the branches that needs to be deleted #{branch_commit_sha - api_ids}"
  end

  def pull_request_matcher(current_user)
    pull_requests = PullRequest.where(user_id: current_user.id)
  end

  def pull_request_comment_matcher(current_user)
    pull_request_comment = PullRequestComment.where(user_id: current_user.id)
  end
end
