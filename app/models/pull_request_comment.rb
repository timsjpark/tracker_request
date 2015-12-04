class PullRequestComment < ActiveRecord::Base
  belongs_to :pull_request
end
