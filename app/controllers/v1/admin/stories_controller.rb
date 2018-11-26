class V1::Admin::StoriesController < V1::Admin::BaseController
  before_action :set_stories

  include Stories


  private
  def set_stories
      @stories = ::Story.all
  end
end
