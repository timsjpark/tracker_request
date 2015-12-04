class Client
  def initialize
    if current_user
      user = User.find_by(id: session[:id])
      encrypted_key = user.select(:api_key)
      client_api_key = Encrypt_Decrypt.new.decrypt(encrypted_key)
      client_connect = Ocotokit::Client.new(:access_token => "#{client_api_key}")
    else
      return false;
    end
  end
end
