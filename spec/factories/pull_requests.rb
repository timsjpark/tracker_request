FactoryGirl.define do
  factory :pull_request do
    pr_state "open"
    pr_base_commit "MyString"
    repository nil
  end
end
