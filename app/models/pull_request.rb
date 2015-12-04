class PullRequest < ActiveRecord::Base
  belongs_to :repository
  has_many :pull_request_comments
end
