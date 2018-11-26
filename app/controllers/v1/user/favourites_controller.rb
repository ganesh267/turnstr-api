class V1::User::FavouritesController < V1::BaseController

  # GET /user/favourites
  def index
    @favourites = current_user.favourites.page(0).per(5)
    render_success data: {
        favourites: ActiveModel::Serializer::CollectionSerializer.new(@favourites, serializer: UserListSerializer),
        total_pages: @favourites.total_pages,
        current_page: @favourites.current_page,
        next_page: @favourites.next_page,
        prev_page: @favourites.prev_page,
        first_page: @favourites.first_page?,
        last_page: @favourites.last_page?
    }


  end  


end
