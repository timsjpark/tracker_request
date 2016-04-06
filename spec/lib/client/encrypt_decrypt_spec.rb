require 'rails_helper'

RSpec.describe Client::Encrypt_Decrypt, type: :feature do

  describe ".encrypt" do
    it 'changes the value to an encrypted value' do
      value = 123456
      encrypted = Client::Encrypt_Decrypt.new.encrypt(value)
      expect(encrypted).not_to eq(value)
    end
  end

  describe ".decrypt" do
    it 'equals the same value that was encrypted' do
      value = 123456
      client = Client::Encrypt_Decrypt.new
      encrypted = client.encrypt(value)
      decrypt = client.decrypt(encrypted)
      expect(decrypt).to eq(value)
    end
  end
end
