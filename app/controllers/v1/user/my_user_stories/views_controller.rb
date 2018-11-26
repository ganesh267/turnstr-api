class V1::User::MyUserStories::ViewsController < V1::User::MyUserStories::BaseController

  # GET /user/my_user_stories/1/views
  def index
    views = @user_story.viewers_by_group(current_page)

    render_success data: {
        family: ActiveModel::Serializer::CollectionSerializer.new(views[:family], serializer: UserListSerializer),
        others: ActiveModel::Serializer::CollectionSerializer.new(views[:others], serializer: UserListSerializer)
        #total_pages: @views.total_pages,
        #current_page: @views.current_page,
        #next_page: @views.next_page,
        #prev_page: @views.prev_page,
        #first_page: @views.first_page?,
        #last_page: @views.last_page?
    }
  end

end
