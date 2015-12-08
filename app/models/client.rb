class Client
  attr_reader :client_connect

  def initialize(current_user)
    @current_user = current_user
    if @current_user
      # user = User.find_by(id: @current_user.id)
      @encrypted_key = @current_user.github_api_key
      @client_api_key = Encrypt_Decrypt.new.decrypt(@encrypted_key)
      @client_connect = Octokit::Client.new(:access_token => "#{@client_api_key}")
    else
      return false;
    end
  end
end
