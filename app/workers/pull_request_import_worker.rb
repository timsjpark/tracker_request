class PullRequestImportWorker
  @queue = :pull_request_import_worker

    def self.perform(current_user_id)
      #RepoImport.new(current_user).repo_api_call
      @current_user = User.find(current_user_id)
      @client = Client.new(@current_user)
      @client_connect = @client.client_connect

      @pull_request_info = @client_connect.pull_request("#{@current_user.username}/lrthw_exercises",12)
      pull_request = PullRequest.where(pr_id: @pull_request_info[:id]).first_or_initialize

      if pull_request.new_record?
        pull_request.update(pull_request_params)
      end
    end

    def self.pull_request_params
      {
        pr_id: @pull_request_info[:id],
        pr_state: @pull_request_info[:state],
        pr_base_commit: @pull_request_info[:base][:sha],
        pr_title: @pull_request_info[:title],
        pr_body: @pull_request_info[:body]
      }
    end

end
