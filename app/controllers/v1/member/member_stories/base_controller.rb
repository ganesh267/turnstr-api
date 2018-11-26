class V1::Member::MemberStories::BaseController < V1::Member::BaseController
  before_action :set_member_story


  private
  def set_member_story
    @member_story =@member.my_user_stories.find(params[:member_story_id])
  end


end
