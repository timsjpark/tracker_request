class Client
  attr_reader :client_connect

  def initialize(current_user)
    @current_user = current_user
  end

  def github_client
    if @current_user
      # user = User.find_by(id: @current_user.id)
      @encrypted_key = @current_user.github_api_key
      @client_api_key = Encrypt_Decrypt.new.decrypt(@encrypted_key)
      @client_connect = Octokit::Client.new(:access_token => "#{@client_api_key}")
    else
      return false;
    end
  end

  def pivotal_client
    if @current_user.pivotal_api_key.blank? == false
      @pivotal_key = @current_user.pivotal_api_key
      @client_connet = TrackerApi::Client.new(token: "#{@pivotal_key}")    
    else
      return false;
    end
  end
end
