class ConsoleController < ApplicationController
  before_filter :login_required

  def index
    pivotal_background_jobs if current_user.pivotal_api_key.present?
    github_background_jobs
    @user = User.find(current_user.id)
    @repository = @user.repositories.where(user_id: current_user.id).first
  end

  def profile
    @user = User.find(current_user.id)
  end

  def statistics
  end

  def info
    @repo = Repository.where(id: params[:id]).first
  end

  def branch 
    @branch = Branch.where(id: params[:id]).first
    @branch_repo = Repository.where(id: "#{@branch.repository_id}").first
  end

  def pull 
    @pull_request = PullRequest.where(id: params[:id]).first
    @branch = Repository.find("#{@pull_request.repository_id}").branches
    @pull_request_comments = PullRequestComment.where(repository_id: "#{@pull_request.repository_id}").find_each
  end

  def projectinfo
    @project = Project.where(id: params[:id]).first
  end

  def story
    @story = Story.where(id: params[:id]).first
    @comments = TrackerComment.where(story_id: @story.id)
  end

  private 
  def github_background_jobs
    Resque.enqueue(RepoImportWorker, current_user.id)
    Resque.enqueue(BranchImportWorker, current_user.id)
    Resque.enqueue(PullRequestImportWorker, current_user.id)
    Resque.enqueue(PullRequestCommentImportWorker, current_user.id)
  end

  def pivotal_background_jobs
    Resque.enqueue(ProjectImportWorker, current_user.id)
    Resque.enqueue(StoryImportWorker, current_user.id)
    Resque.enqueue(TrackerCommentImportWorker, current_user.id)
  end
end
