class V1::Content::BackgroundImageGroups::BaseController < V1::Content::BaseController
  before_action :set_background_image_group

  def set_background_image_group
    @background_image_group = BackgroundImageGroup.find(params[:background_image_group_id])
  end
end
