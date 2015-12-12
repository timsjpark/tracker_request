class StoryImportWorker
  @queue = :story_import_worker

  def self.perform(current_user_id)
    current_user = User.find(current_user_id)
    @client = Client.new(current_user)
    @client_connect = @client.pivotal_client

    Project.where(user_id: current_user_id).find_each do |project_info|

      @project = @client_connect.project(project_info[:project_ident])
      @stories = @project.stories()
      @stories.each do |story_info|
        story = Story.where(story_ident: story_info[:id]).first_or_initialize

        story.update(story_params(story_info, project_info))
      end
      # @branch_info = @client_connect.branches("#{repo_info[:repo_full_name]}")
      # @branch_info.each do |branch_info|
      #   branch = Branch.where(latest_commit_sha: branch_info[:commit][:sha]).first_or_initialize
      #
      #   branch.update(branch_params(branch_info,repo_info))
      # end
    end

    Resque.enqueue_in(85.seconds, StoryImportWorker, current_user_id)
  end

  def self.story_params(story_info,project_info)
    {
      story_ident: story_info[:id],
      kind: story_info[:kind],
      name: story_info[:name],
      description: story_info[:description],
      story_type: story_info[:story_type],
      current_state: story_info[:current_state],
      estimate: story_info[:estimate],
      project_id: project_info[:id]
    }
  end
end
