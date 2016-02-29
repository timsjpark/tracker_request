FactoryGirl.define do
  factory :user do
    username "jtest"
    uid 1
    first_name "Joe"
    last_name "Test"
    email "email@email.com"
    avatar_url "jtest.jpg"
    company "Testing Dot Com"
    api_key 1
  end
end
