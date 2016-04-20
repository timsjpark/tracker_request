class GithubApi::PullRequestImport

  def initialize(current_user_id)
    @current_user = User.find(current_user_id)
    @client = Client::Github.new(@current_user)
    @client_connect = @client.connect
  end

  def pull_requests_to_db
    repo_id_array = []
    pull_request_api_array = []
    Repository.where(user_id: @current_user.id).find_each do |repo_info|
      repo_id_array << repo_info.id
      @pull_request_info = @client_connect.pull_requests("#{repo_info[:repo_full_name]}")
      @pull_request_info.each do |pull_request_info|
        pull_request = PullRequest.where(pr_github_ident: pull_request_info[:id]).first_or_initialize

        pull_request.update(pull_request_params(pull_request_info,repo_info))
        pull_request_api_array << pull_request_info[:id]
      end
    end
    GithubApi::Database_Updater.new.update_database_to_match_api(model_call: "pull_request", api_ids: pull_request_api_array, repo_ids: repo_id_array)
  end

  private
  def pull_request_params(pull_request_info,repo_info)
    {
      pr_state: pull_request_info[:state],
      pr_base_commit: pull_request_info[:base][:sha],
      pr_github_ident: pull_request_info[:id],
      pr_title: pull_request_info[:title],
      pr_body: pull_request_info[:body],
      repository_id: repo_info[:id]
    }
  end
end
