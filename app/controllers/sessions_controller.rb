class SessionsController < ApplicationController
  def oauth
    @user = User.where(
      email: omniauth_options[:email]

    ).first_or_initialize(omniauth_options)
    if @user.persisted?
      session[:id] = @user.id
      redirect_to console_path,
        notice: "Welcome back #{@user.username.titleize}"
    else
      @user.save
      redirect_to console_path,
        notice: "Thank you for using our console #{@user.username.titleize}"
    end
  end

  def destroy
    if user = current_user
      session.delete(:id)
      redirect_to root_path, notice: "#{user.email} has been logged out"
    end
  end

  private

  # api_key needs to go through the encryption process first
  # and then it will be passed into the database
  def omniauth_options
    if auth_hash = request.env['omniauth.auth']
      first_name, last_name = auth_hash[:info][:name].split(/\s+/, 2)
      encryption = Encrypt_Decrypt.new
      credentials = auth_hash[:credentials][:token]
      db_credentials = encryption.encrypt(credentials)

      {
        username: auth_hash[:info][:nickname],
        uid: auth_hash[:uid],
        first_name: first_name,
        last_name: last_name,
        email: auth_hash[:info][:email],
        avatar_url: auth_hash[:info][:image],
        api_key: db_credentials
      }
    end
  end
end
