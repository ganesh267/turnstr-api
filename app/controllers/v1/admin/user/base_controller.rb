class V1::Admin::User::BaseController < V1::Admin::BaseController
  before_action :set_user

  def set_user
    @user = ::User.find params[:user_id]
  end

end
