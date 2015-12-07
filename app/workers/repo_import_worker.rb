class RepoImportWorker
  @queue = :repo_import_worker

    def self.perform(current_user_id)
      #RepoImport.new(current_user).repo_api_call
      current_user = User.find(current_user_id)
      @client = Client.new(current_user)
      @client_connect = @client.client_connect

      @repo_info = @client_connect.repositories()
      @repo_info.each do |repo_info|
        repo = Repository.where(repo_id: repo_info[:id]).first_or_initialize

        if repo.new_record?
        # MAY WORK:  repo.update(repo_params)
        # Update all the fields
        # repo.save

          repo.update(repo_params(repo_info,current_user_id))
        end
      end   
    end

    def self.repo_params(repo_info,current_user_id)
      {
        repo_id: repo_info[:id],
        repo_name: repo_info[:name],
        repo_full_name: repo_info[:full_name],
        number_of_forks: repo_info[:forks],
        forked: repo_info[:fork],
        user_id: current_user_id 
      }
    end

end
