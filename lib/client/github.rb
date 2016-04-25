class Client::Github
  def initialize(current_user)
    @current_user = current_user
  end

  def connect
    if @current_user
      @encrypted_key = @current_user.github_api_key
      @client_api_key = Client::Encrypt_Decrypt.new.decrypt(@encrypted_key)
      @client_connect = Octokit::Client.new(:access_token => "#{@client_api_key}")
    else
      false;
    end
  end
end
