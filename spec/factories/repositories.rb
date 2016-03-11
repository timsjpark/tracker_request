FactoryGirl.define do
  # Add the user association in the Factories so that association can be tested properly
  factory :repository do
  id { Faker::Number }
  repo_name { Faker::Lorem.word }
  number_of_forks { Faker::Number.between(1, 6) }
  forked false
  association :user
  end
end
