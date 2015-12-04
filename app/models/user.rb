class User < ActiveRecord::Base
  has_many :repositories

  def decrypt_key(encrypted_key)
    Encrypt_Decrypt.new.decrypt(encrypted_key)
  end
end
