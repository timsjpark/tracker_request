class RepoImport
  def initialize
    @client = Client.new
  end
  
  def repo_api_call
    repositories = @client.all_repositories
  end

  private 
  def repo_parameters
    
    
    
    
    {
      repo_id: 
      repo_name:
      number_of_forks:
      forked:
    }
  end
end
