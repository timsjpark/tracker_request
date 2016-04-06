class Client::Encrypt_Decrypt

  def initialize
    key = key_generator
    @encryptor = ActiveSupport::MessageEncryptor.new(key)
  end

  def encrypt(data_value)
    @encryptor.encrypt_and_sign(data_value)
  end

  def decrypt(data_value)
    @encryptor.decrypt_and_verify(data_value)
  end

  private
  def salt_generator
    salt = ENV['SALT_VALUE']
  end

  def key_generator
    key = ActiveSupport::KeyGenerator.new(passphrase_value).generate_key(salt_generator)
  end

  def passphrase_value
    passphrase = ENV['PASS_PHRASE']
  end
end
