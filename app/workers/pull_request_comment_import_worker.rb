class PullRequestCommentImportWorker
  @queue = :pull_request_comment_import_worker

    def self.perform(current_user_id)

      #RepoImport.new(current_user).repo_api_call
      @current_user = User.find(current_user_id)
      @client = Client.new(@current_user)
      @client_connect = @client.github_client

      Repository.where(user_id: current_user_id).find_each do |repo_info|
          @pull_request_comment_info = @client_connect.issues_comments("#{repo_info[:repo_full_name]}")
          @pull_request_comment_info.each do |pull_request_comment_info|
            pull_request_comment = PullRequestComment.where(pr_comment_github_ident: pull_request_comment_info[:id]).first_or_initialize

            pull_request_comment.update(pull_request_comment_params(pull_request_comment_info,repo_info))
          end
      end
      #Resque.enqueue_in(75.seconds, PullRequestCommentImportWorker, current_user_id)
    end

    def self.pull_request_comment_params(pull_request_comment_info,repo_info)
      {
       pr_comment_github_ident: pull_request_comment_info[:id],
       content_text: pull_request_comment_info[:body],
       repository_id: repo_info[:id]
      }
    end

    private
    def connect_user(current_user_id)
      #RepoImport.new(current_user).repo_api_call
      @current_user = User.find(current_user_id)
      @client = Client.new(@current_user)
      @client_connect = @client.client_connect
    end
end
