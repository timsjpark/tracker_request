FactoryGirl.define do
  # Add the user association in the Factories so that association can be tested properly
  factory :repository do
  repo_id 1
  repo_name "MyString"
  number_of_forks 1
  forked false
  user nil
  end
end
