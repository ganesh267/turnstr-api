class V1::Content::BackgroundImageGroups::BackgroundImagesController <  V1::Content::BackgroundImageGroups::BaseController


  # GET /content/background_image_groups/1/background_images
  def index
    images = @background_image_group.background_images.all.page current_page
    render_success data: {
        images: images,
        total_pages: images.total_pages,
        current_page: images.current_page,
        next_page: images.next_page,
        prev_page: images.prev_page,
        first_page: images.first_page?,
        last_page: images.last_page?
    }
  end
end
