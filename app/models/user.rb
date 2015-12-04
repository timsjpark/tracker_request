class User < ActiveRecord::Base
  def decrypt_key(encrypted_key)
    Encrypt_Decrypt.new.decrypt(encrypted_key)
  end
end
