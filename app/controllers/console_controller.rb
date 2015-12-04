class ConsoleController < ApplicationController
  before_filter :login_required

  def index
    Resque.enqueue(RepoImportWorker)
    #user_profile = User.find(session[:id])
  end

  def profile
  end

  def statistics
  end
end
