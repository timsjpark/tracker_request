FactoryGirl.define do
  factory :user do
    username "jtest"
    uid 1
    first_name "Joe"
    last_name "Test"
    email "email@email.com"
    avatar_url "jtest.jpg"
    github_api_key 112312413
  end
end
