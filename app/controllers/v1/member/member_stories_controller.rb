class V1::Member::MemberStoriesController < V1::Member::BaseController
  before_action :set_user_story, only: [:show]

  # GET /user/my_user_stories
  def index
    @user_stories = @member.my_user_stories.reorder('user_stories.id desc').page current_page
    render_success data: {
        my_user_stories: ActiveModel::Serializer::CollectionSerializer.new(@user_stories, serializer: UserStorySerializer),
        total_pages: @user_stories.total_pages,
        current_page: @user_stories.current_page,
        next_page: @user_stories.next_page,
        prev_page: @user_stories.prev_page,
        first_page: @user_stories.first_page?,
        last_page: @user_stories.last_page?
    }
  end

  # GET /user/my_user_stories/1
  def show
    @user_story.viewed(current_user) unless current_user == @user_story.user
    render json: {success: true, data: { user_story: UserStorySerializer.new(@user_story,scope: { include_details: true}) }}
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_story
      @user_story =@member.my_user_stories.find(params[:id])
    end

end
