class AvaliabilityItem < ActiveRecord::Base
  attr_accessible :avaliability_id, :day, :end_time, :start_time, :type_d
  set_inheritance_column 'object_type'

  belongs_to :avaliability
end
