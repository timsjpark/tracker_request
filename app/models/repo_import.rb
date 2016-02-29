class RepoImport
  attr_reader :client

  def initialize(current_user)
    client = Client.new(current_user)
    @client = client.github_client
  end

  def repo_api_call
    repository = @client.repository(43794189)
    @repo_model = Repository.new
    repo_parameter_save(repository)
  end

  private
  def repo_parameter_save(repository)
    @repo_model.repo_id = repository[:id]
    @repo_model.repo_name = repository[:name]
    @repo_model.number_of_forks = repository[:forks]
    @repo_model.forked = repository[:fork]
    @repo_model.save
  end
end
