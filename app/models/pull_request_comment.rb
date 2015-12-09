class PullRequestComment < ActiveRecord::Base
  belongs_to :repository
end
