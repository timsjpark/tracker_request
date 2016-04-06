class Client::Pivotal

  attr_reader :client_connect

  def initialize(current_user)
    @current_user = current_user
  end

  def connect
    if @current_user.pivotal_api_key.blank? == false
      @pivotal_key = @current_user.pivotal_api_key
      @pivotal_key = Client::Encrypt_Decrypt.new.decrypt(@pivotal_key)
      @client_connect = TrackerApi::Client.new(token: "#{@pivotal_key}")
    else
      false;
    end
  end
end
