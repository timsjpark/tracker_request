class GithubApi::RepoImport

    def initialize(current_user_id)
      @current_user = User.find(current_user_id)
      @client = Client.new(@current_user)
      @client_connect = @client.github_client
    end

    def repositories_to_db
      @repo_info = @client_connect.repositories()
      @repo_info.each do |repo_info|
        repo = Repository.where(repo_github_ident: repo_info[:id]).first_or_initialize

        repo.update(repo_params(repo_info,@current_user.id))
      end
    end

    private
    def repo_params(repo_info,current_user_id)
      parent_repo = repo_info[:parent].present? ? repo_info[:parent][:full_name] : nil
      {
        repo_name: repo_info[:name],
        repo_github_ident: repo_info[:id],
        repo_full_name: repo_info[:full_name],
        number_of_forks: repo_info[:forks],
        forked: repo_info[:fork],
        parent_repo: parent_repo,
        user_id: current_user_id
      }
    end
end
