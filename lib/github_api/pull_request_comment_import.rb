class GithubApi::PullRequestCommentImport

  def initialize(current_user_id)
    @current_user = User.find(current_user_id)
    @client = Client::Github.new(@current_user)
    @client_connect = @client.connect
  end

  def pr_comments_to_db
    Repository.where(user_id: @current_user.id).find_each do |repo_info|
          @pull_request_comment_info = @client_connect.issues_comments("#{repo_info[:repo_full_name]}")
          @pull_request_comment_info.each do |pull_request_comment_info|
            pull_request_comment = PullRequestComment.where(pr_comment_github_ident: pull_request_comment_info[:id]).first_or_initialize

            pull_request_comment.update(pull_request_comment_params(pull_request_comment_info,repo_info))
          end
      end
  end

  private
  def pull_request_comment_params(pull_request_comment_info,repo_info)
    {
      pr_comment_github_ident: pull_request_comment_info[:id],
      content_text: pull_request_comment_info[:body],
      repository_id: repo_info[:id]
    }
  end
end
