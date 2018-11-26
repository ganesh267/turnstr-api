class V1::User::UserStoriesController < V1::User::BaseController
  before_action :set_user, only: [:show]

  # GET /user/user_stories
  def index
    @users = current_user.following.with_user_story.distinct.reorder('user_stories.updated_at desc').page current_page
    render_success data: {
        users: ActiveModel::Serializer::CollectionSerializer.new(@users, serializer: UserListForStorySerializer, scope: { current_user: current_user}),
        current_user_story_count: current_user.my_user_stories.count,
        total_pages: @users.total_pages,
        current_page: @users.current_page,
        next_page: @users.next_page,
        prev_page: @users.prev_page,
        first_page: @users.first_page?,
        last_page: @users.last_page?
    }
  end

  # GET /user/user_stories/1
  def show
    # @user_story.viewed(current_user) unless current_user == @user_story.user

    render json: {success: true, data: {user_stories: ActiveModel::Serializer::CollectionSerializer.new(@user.my_user_stories.reorder('user_stories.id desc'), serializer: UserStorySerializer) }}
  end


  # this API is used to mark specific story viewed
  def update
    user_story = current_user.following_user_stories.find params[:id]
    user_story.viewed(current_user) unless current_user == user_story.user

    render json: {success: true, data: { user_story: UserStorySerializer.new(user_story) } }

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user =current_user.following.find(params[:id])
    end

end
