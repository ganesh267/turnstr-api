class V1::User::MyUserStories::BaseController < V1::User::BaseController
  before_action :set_user_story


  private
  def set_user_story
    @user_story =current_user.my_user_stories.find(params[:my_user_story_id])
  end


end
