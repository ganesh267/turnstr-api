class V1::Admin::SessionsController < V1::Admin::BaseController

  # Filters
  skip_before_action :validate_admin

  # POST /v1/admin/sessions
  def create
     # Check required params
    check_required_params params, [:login, :password]

    if @current_admin = ::Admin.login(params[:login], params[:password])
      render_success message: I18n.t('session.login'), data: { auth_token: @current_admin.auth_token, user: Admin::AdminSerializer.new(@current_admin) }
    else
      render_unauthorized message: I18n.t('session.invalid_creds')
    end
  end

end
