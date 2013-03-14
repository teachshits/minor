class Shift < ActiveRecord::Base
  belongs_to :employee
  include ActionView::Helpers

  scope :before, lambda {|end_time| {:conditions => ["ends_at < ?", Shift.format_date(end_time)] }}
  scope :after, lambda {|start_time| {:conditions => ["starts_at > ?", Shift.format_date(start_time)] }}

  # need to override the json view to return what full_calendar is expecting.
  # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.title,
      :description => self.description || "",
      :start => starts_at.rfc822[0..-7],
      :end => ends_at.rfc822[0..-7],
      :allDay => false,
      :recurring => false,
      :url =>  "", #to make events clickable => Rails.application.routes.url_helpers.shift_path(id)
      :userID => self.employee_id
      #:color => color
    }
  end
  
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end

 
end
