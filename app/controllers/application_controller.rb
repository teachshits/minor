class ApplicationController < ActionController::Base
# TODO * Partial engadge
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

  def datetime_from_date_time(d, t)
    DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
  end

  def calc_stime(time)
      @h = {}
      @range.zip(time) { |a,b| @h[a] = b }
      @h = @h.reject { |k,v| v.blank?  }
      array = []
      @h.each do |k,v|
      array << datetime_from_date_time(k,v).rfc822
      end
      return array
  end

def cal_json(id)
    {
      :id => id,
      :title => title,
      :description => description || "",
      :start => starts_at.rfc822[0..-7],
      :end => ends_at.rfc822[0..-7],
      :allDay => false,
      :recurring => false,
      :url =>  "", #to make events clickable => Rails.application.routes.url_helpers.shift_path(id)
      :userID => employee_id
      #:color => color
    }
  end

end
