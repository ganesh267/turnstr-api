require 'jwt_auth_token'

module AuthenticateAdmin
  extend ActiveSupport::Concern

  included do

    # Check for logged in user on every API call
    before_action :validate_admin

  end



  # This method is called before every Api action and sets the current_user and
  # current_company. If not authenticated or not valid user, it will throw error
  # with 401 status code.

  def validate_admin
    # first make sure we have company information in header

    token   = request.headers['HTTP_AUTH_TOKEN']
    token ||= params['auth_token']

    if token.present?
      # if api_token && api_token.admin
      if set_current_admin(token)
        true
      else
        render_unauthorized message: I18n.t('base.not_authenticated')
      end
    else
      render_unauthorized message: I18n.t('base.login_required')
    end
  end

  # extract user_id from decoded_token and set current_admin accordinally
  def set_current_admin token
    if decoded_token = JwtAuthToken.valid?(token)
      @current_admin = Admin.find_by id: decoded_token[0]['admin_id']
    end
  end




end
