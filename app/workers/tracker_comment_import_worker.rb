class TrackerCommentImportWorker
  @queue = :tracker_comment_import_worker

  def self.perform(current_user_id)
    current_user = User.find(current_user_id)
    @client = Client.new(current_user)
    @client_connect = @client.pivotal_client

    Project.where(user_id: current_user_id).find_each do |project_info|

      Story.where(project_id: project_info[:id]).find_each do |story_info|

        @tracker_comments = @client_connect.comments(project_info[:project_ident], story_info[:story_ident])
        @tracker_comments.each do |comment_info|
          tracker_comment = TrackerComment.where(comment_ident: [comment_info[:id]]).first_or_initialize
          tracker_comment.update(tracker_comment_params(comment_info, story_info))
        end
      end
    end

    Resque.enqueue_in(100.seconds, TrackerCommentImportWorker, current_user_id)
  end

  def self.tracker_comment_params(comment_info,story_info)
    {
        comment_ident: comment_info[:id],
        text: comment_info[:text],
        story_id: story_info[:id],
    }
  end
end
