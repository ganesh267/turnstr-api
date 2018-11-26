class V1::Admin::BaseController < ApplicationController

  include AuthenticateAdmin

  def current_admin
    @current_admin
  end

end
