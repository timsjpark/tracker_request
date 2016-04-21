class PivotalApi::Database_Updater

  def update_database_to_match_api(args={})
    if args[:current_user] != nil
      project_matcher(args[:api_ids], args[:current_user])
    elsif args[:project_id] != nil
      story_matcher([:api_ids], args[:project_id])
    elsif args[:story_id] != nil
      story_comment_matcher([:api_ids], args[:story_id])
    else
      "Error finding database model!"
    end
  end

  private
  def project_matcher(api_ids, current_user)
    projects = Project.where(user_id: current_user.id).all
    project_ids = []
    projects.each {|x| project_ids << x.project_ident}
    Project.where(project_ident: project_ids - api_ids).destroy_all
  end

  def story_matcher(api_ids, project_ids)
    #story_ident
    projects = Project.where(user_id: current_user.id).all
    project_ids = []
    projects.each {|x| project_ids << x.project_ident}
    Project.where(project_ident: project_ids - api_ids).destroy_all
  end

  def story_comment_matcher(api_ids, story_ids)
    #comment_ident
    pull_requests = PullRequest.where(repository_id: repo_ids).select([:pr_github_ident])
    pr_github_array = []
    pull_requests.each {|x| pr_github_array << x.pr_github_ident}
    PullRequest.where(pr_github_ident: pr_github_array - api_ids).destroy_all
  end
end
