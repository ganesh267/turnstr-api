class V1::Admin::User::Story::CommentsController < V1::Admin::User::Story::BaseController
  before_action :set_comments

  include Comments


  private
  def set_comments
    @comments = @story.comments
  end
  
end
