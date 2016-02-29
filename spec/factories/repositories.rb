FactoryGirl.define do
  # Add the user association in the Factories so that association can be tested properly
  factory :repository do
  id 1
  repo_name "MyString"
  number_of_forks 1
  forked false
  association :user
  end
end
