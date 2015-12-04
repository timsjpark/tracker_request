class RepoImportWorker
  @queue = :repo_import_worker

    def self.perform(current_user)
      RepoImport.new(current_user).repo_api_call
    end
end
