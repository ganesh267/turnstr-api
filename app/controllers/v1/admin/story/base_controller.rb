class V1::Admin::Story::BaseController < V1::Admin::BaseController
  before_action :set_story

  def set_story
    @story = ::Story.find params[:story_id]
  end

end
