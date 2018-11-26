class V1::Admin::User::StoriesController < V1::Admin::User::BaseController
  before_action :set_stories

  include Stories



  private
  def set_stories
      @stories = @user.stories.all
  end
end
