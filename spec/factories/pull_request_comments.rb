FactoryGirl.define do
  factory :pull_request_comment do
    content_text "MyString"
    pull_request nil
  end
end
