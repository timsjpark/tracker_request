class PivotalApi::StoryCommentImport
  def initialize(current_user_id)
    @current_user = User.find(current_user_id)
    @client_connect = Client::Pivotal.new(@current_user).connect
  end

  def story_comments_to_db
    Project.where(user_id: @current_user.id).find_each do |project_info|

      Story.where(project_id: project_info[:id]).find_each do |story_info|

        @tracker_comments = story_comments(project_info[:project_ident], story_info[:story_ident])
        @tracker_comments.each do |comment_info|
          tracker_comment = TrackerComment.where(comment_ident: [comment_info[:id]]).first_or_initialize
          tracker_comment.update(tracker_comment_params(comment_info, story_info))
        end
      end
    end
  end

  private
  def tracker_comment_params(comment_info,story_info)
    {
      comment_ident: comment_info[:id],
      text: comment_info[:text],
      story_id: story_info[:id]
    }
  end

  def story_comments(project_id, story_id)
    data = @client_connect.paginate("/projects/#{project_id}/stories/#{story_id}/comments")
  end
end
