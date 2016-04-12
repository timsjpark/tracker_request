class BranchImportWorker
  @queue = :branch_import_worker

  def self.perform(current_user_id)
    GithubApi::BranchImport.new(current_user_id).branches_to_db
  end
end
