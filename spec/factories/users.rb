FactoryGirl.define do
  factory :user do
    username "jtest"
    uid 1
    first_name "Joe"
    last_name "Test"
    email "email@email.com"
    avatar_url "jtest.jpg"
    github_api_key Client::Encrypt_Decrypt.new.encrypt(ENV['TESTING_API'])
  end
end
