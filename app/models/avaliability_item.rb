class AvaliabilityItem < ActiveRecord::Base
# TODO * Validation on model	
  attr_accessible :avaliability_id, :day, :end_time, :start_time, :type_d
  set_inheritance_column 'object_type'

  belongs_to :avaliability
end
