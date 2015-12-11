class User < ActiveRecord::Base
  has_many :repositories
  has_many :projects
  has_many :stories, through: :projects

  def decrypt_key(encrypted_key)
    Encrypt_Decrypt.new.decrypt(encrypted_key)
  end
end
