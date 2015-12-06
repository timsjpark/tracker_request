class RepoImportWorker
  @queue = :repo_import_worker

    def self.perform(current_user_id)
      #RepoImport.new(current_user).repo_api_call
      current_user = User.find(current_user_id)
      @client = Client.new(current_user)
      @client_connect = @client.client_connect

      @repo_info = @client_connect.repository(43794189)
      repo = Repository.where(repo_id: @repo_info[:id]).first_or_initialize

      if repo.new_record?
        # MAY WORK:  repo.update(repo_params)
        # Update all the fields
        # repo.save

        #@repo_model = Repository.new
        #@repo_model.repo_id = @repo_info[:id]
        #@repo_model.repo_name = @repo_info[:name]
        #@repo_model.number_of_forks = @repo_info[:forks]
        #@repo_model.forked = @repo_info[:fork]

        repo.update(repo_params)
      end

      #@repo_model.save
    end

    def self.repo_params
      {
        repo_id: @repo_info[:id],
        repo_name: @repo_info[:name],
        number_of_forks: @repo_info[:forks],
        forked: @repo_info[:fork]
      }
    end

end
