class ApplicationController < ActionController::Base
# TODO 1. POS1: RANK 3, POS2: RANK 1 + many position for one employee
# TODO * adding many user
# TODO * Partial engadge
# TODO Clean params tag and make it through assotiation
  protect_from_forgery
  include UsersessionsHelper
  helper_method :set_business

  def set_business
    @business = Business.find_by_id(session[:biz_id])
  end
  
  def render_404
    #temporary 404 action
    redirect_to timesheets_path
  end
end
