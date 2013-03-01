class Period < ActiveRecord::Base
# TODO * Validation on model	
  attr_accessible :p_end, :p_start

  has_many :schedules
  has_many :business_workdays
end
