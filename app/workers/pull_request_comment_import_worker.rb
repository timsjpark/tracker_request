class PullRequestCommentImportWorker
  @queue = :pull_request_comment_import_worker

    def self.perform(current_user_id)
      #RepoImport.new(current_user).repo_api_call
      @current_user = User.find(current_user_id)
      @client = Client.new(@current_user)
      @client_connect = @client.client_connect

      @pull_request_comment_info = @client_connect.issue_comment("#{@current_user.username}/lrthw_exercises",162289807)
      pull_request_comment = PullRequestComment.where(pr_comment_id: @pull_request_comment_info[:id]).first_or_initialize

      if pull_request_comment.new_record?
        pull_request_comment.update(pull_request_comment_params)
      end
    end

    def self.pull_request_comment_params
      {
       pr_comment_id: @pull_request_comment_info[:id],
       content_text: @pull_request_comment_info[:body]
      }
    end

end
