class V1::Content::BackgroundImageGroupsController < V1::Content::BaseController


  # GET /content/background_image_group
  def index
    groups = BackgroundImageGroup.all.page current_page
    render_success data: {
        groups: groups,
        total_pages: groups.total_pages,
        current_page: groups.current_page,
        next_page: groups.next_page,
        prev_page: groups.prev_page,
        first_page: groups.first_page?,
        last_page: groups.last_page?
    }
  end
end
