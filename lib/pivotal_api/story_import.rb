class PivotalApi::StoryImport
  def initialize(current_user_id)
    @current_user = User.find(current_user_id)
    @client_connect = Client::Pivotal.new(@current_user).connect
  end

  def stories_to_db
    Project.where(user_id: @current_user.id).find_each do |project_info|
      @project = @client_connect.project(project_info[:project_ident])
      @stories = @project.stories()
      @stories.each do |story_info|
        story = Story.where(story_ident: story_info[:id]).first_or_initialize
        story.update(story_params(story_info, project_info))
      end
    end
  end

  private
  def story_params(story_info,project_info)
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
