class RepoImportWorker
  @queue = :repo_import_worker

    def self.perform()
      put "Hello world"
    end
end
