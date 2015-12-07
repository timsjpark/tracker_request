class ConsoleController < ApplicationController
  before_filter :login_required

  def index
    background_jobs
    @user = User.find(session[:id])
    @repositories = @user.repositories
    @repository = @user.repositories.where(user_id: session[:id]).first
  end

  def profile
    @user = User.find(session[:id])
  end

  def statistics
  end

  private 
  def background_jobs
    Resque.enqueue(RepoImportWorker, current_user.id)
    Resque.enqueue(BranchImportWorker, current_user.id)
    Resque.enqueue(PullRequestImportWorker, current_user.id)
    Resque.enqueue(PullRequestCommentImportWorker, current_user.id)
  end
end
