class ConsoleController < ApplicationController
  before_filter :login_required

  def index
    background_jobs
    @user = User.find(current_user.id)
    @repository = @user.repositories.where(user_id: current_user.id).first
  end

  def profile
    @user = User.find(current_user.id)
  end

  def statistics
  end

  def repo_info
    @repo = Repository.where(id: 1).first
  end

  private 
  def background_jobs
    Resque.enqueue(RepoImportWorker, current_user.id)
    Resque.enqueue(BranchImportWorker, current_user.id)
    Resque.enqueue(PullRequestImportWorker, current_user.id)
    Resque.enqueue(PullRequestCommentImportWorker, current_user.id)
  end
end
