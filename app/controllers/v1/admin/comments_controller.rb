class V1::Admin::CommentsController < V1::Admin::BaseController
  before_action :set_comments

  include Comments


  private
  def set_comments
    @comments = ::Comment.all
  end
  
end
