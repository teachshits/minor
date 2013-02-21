class Period < ActiveRecord::Base
  attr_accessible :p_end, :p_start

  has_many :schedules
  has_many :business_workdays
end
