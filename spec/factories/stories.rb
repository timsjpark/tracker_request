FactoryGirl.define do
  factory :story do
    story_ident 1
    kind "MyString"
    name "MyString"
    description "MyText"
    story_type "MyString"
    current_state "MyString"
    estimate "MyString"
    project nil
  end
end
