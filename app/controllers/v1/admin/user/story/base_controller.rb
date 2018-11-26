class V1::Admin::User::Story::BaseController < V1::Admin::User::BaseController
  before_action :set_story

  def set_story
    @story = @user.stories.find params[:story_id]
  end

end
