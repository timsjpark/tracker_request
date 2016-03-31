class BranchImportWorker

  @queue = :branch_import_worker

    def self.perform(current_user_id)
      #RepoImport.new(current_user).repo_api_call
      current_user = User.find(current_user_id)
      @client = Client.new(current_user)
      @client_connect = @client.github_client

      Repository.where(user_id: current_user_id).find_each do |repo_info|

        @branch_info = @client_connect.branches("#{repo_info[:repo_full_name]}")
        @branch_info.each do |branch_info|
          branch = Branch.where(latest_commit_sha: branch_info[:commit][:sha]).first_or_initialize

          branch.update(branch_params(branch_info,repo_info))
        end
      end
      #Resque.enqueue_in(65.seconds, BranchImportWorker, current_user_id)
    end

    def self.branch_params(branch_info,repo_info)
      {
        branch_name: branch_info[:name],
        latest_commit_sha: branch_info[:commit][:sha],
        repository_id: repo_info[:id]
      }
    end
end
