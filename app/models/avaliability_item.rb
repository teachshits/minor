class AvaliabilityItem < ActiveRecord::Base
  attr_accessible :avaliability_id, :day, :end_time, :start_time, :type

  belongs_to :avaliability
end
