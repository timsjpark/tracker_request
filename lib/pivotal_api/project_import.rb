class PivotalApi::ProjectImport

  def initialize(current_user_id)
    @current_user = User.find(current_user_id)
    @client_connect = Client::Pivotal.new(@current_user).connect
  end

  def projects_to_db
    @projects = @client_connect.projects()
    @projects.each do |project_info|
      project = Project.where(project_ident: project_info[:id]).first_or_initialize

      project.update(project_params(project_info,@current_user.id))
    end
  end

  private
  def project_params(project_info,current_user_id)
    {
      project_ident: project_info[:id],
      name: project_info[:name],
      iteration_length: project_info[:iteration_length],
      week_start_day: project_info[:week_start_day],
      user_id: current_user_id
    }
  end
end
