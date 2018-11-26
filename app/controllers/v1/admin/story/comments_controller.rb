class V1::Admin::Story::CommentsController < V1::Admin::Story::BaseController
  before_action :set_comments

  include Comments


  private
  def set_comments
    @comments = @story.comments
  end
  
end
