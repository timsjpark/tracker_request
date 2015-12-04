class Repository < ActiveRecord::Base
  belongs_to :user
  has_many :branches
  has_many :pull_requests
end
