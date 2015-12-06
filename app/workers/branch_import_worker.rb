class BranchImportWorker
  
  @queue = :branch_import_worker

    def self.perform(current_user_id)
      #RepoImport.new(current_user).repo_api_call
      current_user = User.find(current_user_id)
      @client = Client.new(current_user)
      @client_connect = @client.client_connect

      @branch_info = @client_connect.branch(43794189, "master")
      branch = Branch.where(branch_name: @branch_info[:name]).first_or_initialize

      if branch.new_record?
        branch.update(branch_params)
      end
    end

    def self.branch_params
      {
        branch_name: @branch_info[:name],
        latest_commit_sha: @branch_info[:commit][:sha]
      }
    end

end
