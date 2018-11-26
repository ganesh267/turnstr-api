class V1::User::BackgroundImageController < V1::User::BaseController

  # POST /user/background_image
  def create
    if current_user.background_image.nil?
      if current_user.create_background_image(image_params)
        render_success data: {user: UserSerializer.new(current_user) }, message: I18n.t('resource.created', resource: User::BackgroundImage.model_name.human)
      else
        render_unprocessable_entity message: @image.errors.full_messages.join(', ')
      end
    else
      if current_user.background_image.update_attributes(image_params)
        render_success data: {user: UserSerializer.new(current_user) }, message: I18n.t('resource.created', resource: User::BackgroundImage.model_name.human)
      else
        render_unprocessable_entity message: @image.errors.full_messages.join(', ')
      end
    end
   end


  private
    # Only allow a trusted parameter "white list" through.
    def image_params
      params.require(:user).permit(:image)
    end
end
