class GithubApi::Database_Updater

  def initialize
  end

  def update_database_to_match_api(args={})
    args[:model_call] ||= nil
    args[:api_ids] ||= nil
    args[:current_user] ||= nil
    args[:repo_ids] ||= nil

    case args[:model_call]
      when "repository"
        if args[:current_user] != nil
          repo_matcher(args[:current_user], args[:api_ids])
        end
      when "branch"
        if args[:repo_ids] != nil
          branch_matcher(args[:current_user], args[:api_ids], args[:repo_ids])
        end
      when "pull_request"
        if args[:repo_ids] != nil
          pull_request_matcher(args[:current_user], args[:api_ids], args[:repo_ids])
        end
      when "pull_request_comment"
        if args[:repo_ids] != nil
          pull_request_comment_matcher(args[:current_user], args[:api_ids], args[:repo_ids])
        end
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
    branches = Branch.where(repository_id: repo_ids).select([:latest_commit_sha, :branch_name])
    branch_commit_sha = []
    branches.each {|x| branch_commit_sha << "#{x.branch_name} #{x.latest_commit_sha}"}
    branch_commit_sha.each {|x| puts x}
    puts "=============="
    api_ids.each {|x| puts x}
    puts "Branch Model counts #{branch_commit_sha.count}"
    puts "Branch API counts #{api_ids.count}"
    puts "These are the branches that needs to be deleted #{branch_commit_sha - api_ids}"
  end

  def pull_request_matcher(current_user, api_ids, repo_ids)
    pull_requests = PullRequest.where(repository_id: repo_ids).select([:pr_github_ident])
    pr_github_array = []
    pull_requests.each {|x| pr_github_array << x.pr_github_ident}
    pr_github_array.each {|x| puts x}
    puts "=========="
    api_ids.each {|x| puts x}
    puts "Branch Model counts #{pr_github_array.count}"
    puts "Branch API counts #{api_ids.count}"
    puts "These are the branches that needs to be deleted #{pr_github_array - api_ids}"
  end

  def pull_request_comment_matcher(current_user, api_ids, repo_ids)
    pull_request_comments = PullRequestComment.where(repository_id: repo_ids).select([:pr_comment_github_ident])
    pr_comment_github_array = []
    pull_request_comments.each {|x| pr_comment_github_array << x.pr_comment_github_ident }
    pr_comment_github_array.each {|x| puts x}
    puts "=========="
    api_ids.each {|x| puts x}
    puts "Branch Model counts #{pr_comment_github_array.count}"
    puts "Branch API counts #{api_ids.count}"
    puts "These are the branches that needs to be deleted #{pr_comment_github_array - api_ids}"
  end
end
