class Story < ActiveRecord::Base
  belongs_to :project
  has_many :tracker_comments
end
