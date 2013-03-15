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
 #@time.schedule_emp_show
  def schedule_emp_show(schedule)
      @arry = []
      schedule.each do |sch|
        @arry << sch.schedule_show
      end 
      @arry
  end
  def schedule_all
     all = Employee.all
     schedules = []
     all.each do |emp|
     schedules << emp.schedules.last unless nil?
     end
     schedules.compact! # nil delete
     l = []
     schedules.each do |sch|
      l << sch.schedule_show
     end  
     l.flatten
  end

end
