class RepoImportWorker
  @queue = :repo_import_worker

    def self.perform(current_user_id)
      GithubApi::RepoImport.new(current_user_id).repositories_to_db
    end

end
