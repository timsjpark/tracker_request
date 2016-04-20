class GithubApi::BranchImport

  def initialize(current_user_id)
    @current_user = User.find(current_user_id)
    @client = Client::Github.new(@current_user)
    @client_connect = @client.connect
  end

  def branches_to_db
    repo_id_array = []
    branch_api_array = []
    Repository.where(user_id: @current_user.id).find_each do |repo_info|
      repo_id_array << repo_info.id
      @branch_info = @client_connect.branches("#{repo_info[:repo_full_name]}")
      @branch_info.each do |branch_info|
        branch = Branch.where(latest_commit_sha: branch_info[:commit][:sha], branch_name: branch_info[:name]).first_or_initialize
        branch.update(branch_params(branch_info,repo_info))
        branch_api_array << "#{branch_info[:name]} #{branch_info[:commit][:sha]}"
      end
    end
    GithubApi::Database_Updater.new.update_database_to_match_api(model_call: "branch", api_ids: branch_api_array, repo_ids: repo_id_array)
  end

  private
  def branch_params(branch_info,repo_info)
    {
      branch_name: branch_info[:name],
      latest_commit_sha: branch_info[:commit][:sha],
      repository_id: repo_info[:id]
    }
  end
end
