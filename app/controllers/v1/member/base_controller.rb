class V1::Member::BaseController < V1::BaseController
  before_action :set_member


  private
  def set_member
    @member =User.find(params[:member_id])
  end


end
